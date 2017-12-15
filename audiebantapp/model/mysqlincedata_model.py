#!/usr/bin/env python
# -*- coding: utf-8 -*-
# create by zhangsp 2017-70-26
# 用户全线增删改查

import sys
import MySQLdb
from django.db import connection
reload(sys)


class MysqlIncedata(object):

    def __init__(self, nUserRole, nRightUserid, nDbid, nSqlcontent, nTaskid):
        self.nUserRole = nUserRole
        self.nRightUserid = nRightUserid
        self.nDbid = nDbid
        self.nSqlcontent = nSqlcontent
        self.nTaskid = nTaskid

    @classmethod
    def mysqllist(self, nUserRole, nRightUserid):
        if nUserRole == 1:
            nsql = "select a.db_id,a.db_name,a.server_id,b.server_name,a.db_server_type,a.db_type,db_port,a.db_user,if(b.use_outer_inner=2,b.outer_net,b.inner_net),date_format(a.create_time,'%Y-%m-%d %H:%i:%s'),a.default_dbname from db_server_info a left join server_info b on a.server_id=b.server_id where a.db_type=1 order by a.db_type,a.create_time"
        else:
            nsql = "select a.db_id,a.db_name,a.server_id,b.server_name,a.db_server_type,a.db_type,db_port,a.db_user,if(b.use_outer_inner=2,b.outer_net,b.inner_net),date_format(a.create_time,'%%Y-%%m-%%d %%H:%%i:%%s'),a.default_dbname  from db_server_info a left join server_info b on a.server_id=b.server_id join user_db_relation c on a.db_id=c.db_id where a.db_type=1 and c.userid=%s order by a.db_type,a.create_time"  % (nRightUserid)
        cursor = connection.cursor()
        cursor.execute(nsql)
        rows = cursor.fetchall()
        cursor.close()
        jsonData = []
        for row in rows:
            result = {}
            result['dbid'] = row[0]
            result['dbname'] = row[1]
            result['serverid'] = row[2]
            result['servername'] = row[3]
            result['dbservertype'] = row[4]
            result['dbtype'] = row[5]
            result['dbport'] = row[6]
            result['dbuser'] = row[7]
            result['dbnet'] = row[8]
            result['createtime'] = row[9]
            result['deafultdbname'] = row[10]
            jsonData.append(result)
        return jsonData

    @classmethod
    def gettastnum(self, nUserRole, nRightUserid):
        if nUserRole == 1:
            nsql="select (select count(*) from sql_update_task_info where task_type=1) as endnum,(select count(*) from sql_update_task_info where task_type=0) as beginnum"

        else:
            nsql = "select (select count(*) from sql_update_task_info where task_type=1 and user_id=%s) as endnum,(select count(*) from sql_update_task_info where task_type=0 and user_id=%s) as beginnum" % (nRightUserid)
        cursor = connection.cursor()
        cursor.execute(nsql)
        rows = cursor.fetchone()
        cursor.close()
        jsonData = []
        result = {}
        result['endnum'] = rows[0]
        result['beginnum'] = rows[1]
        jsonData.append(result)
        return jsonData

    @classmethod
    def addmysqlsqltask(self, nDbid, nSqlcontent, nUserid):
        nSql = "select if(b.use_outer_inner=2,b.outer_net,b.inner_net) as netip,db_port,db_user,db_passport,default_dbname from db_server_info a join server_info b on a.server_id=b.server_id where a.db_id = %s"
        cursor = connection.cursor()
        cursor.execute(nSql, [nDbid])
        rows = cursor.fetchone()
        cursor.close()

        nNet = rows[0]
        nDbport = int(rows[1])
        nDBuser = rows[2]
        nDballpripwd = rows[3]
        nDefaultdbname = rows[4]
        nUpdateType = 1
        nTaskSql = "insert into sql_update_task_info(user_id,db_id,update_type,sql_data) values(%s,%s,%s,%s)"
        cursor = connection.cursor()
        cursor.execute(nTaskSql, [nUserid, nDbid, nUpdateType, nSqlcontent])
        taskid = cursor.lastrowid
        cursor.close()
        connection.commit()
        connection.close()

        nIncepsql = '/*--user=%s;--password=%s;--host=%s;--enable-check;--port=%d;*/' % (
        nDBuser, nDballpripwd, nNet, nDbport) + '\n' \
                    + 'inception_magic_start;' + '\n' \
                    + nSqlcontent.encode('utf8') + '\n' \
                    + 'inception_magic_commit;'

        nIncepsql = nIncepsql.encode('utf-8').decode('latin-1')

        conn = MySQLdb.connect(host="127.0.0.1", user="root", passwd="12345678", db="Biz", port=6669)
        cursor = conn.cursor()
        cursor.execute(nIncepsql)
        result = cursor.fetchall()
        cursor.close()
        conn.close()
        for row in result:
            nCheckid = row[0]
            nCheckstage = row[1]
            nErrlevel = row[2]
            nStagestatus = row[3]
            nErrormessage = row[4].encode('utf8')
            nChecksql = row[5].encode('utf8')
            nAffectedrows = row[6]

            checkSql = 'insert into sql_check_task_info(task_id,check_id,check_stage,err_level,stage_status,error_messge,check_sql,affected_row) values (%s,%s,%s,%s,%s,%s,%s,%s)'
            cursor = connection.cursor()
            cursor.execute(checkSql,
                       [taskid, nCheckid, nCheckstage, nErrlevel, nStagestatus, nErrormessage, nChecksql, nAffectedrows])
            cursor.close()
            connection.commit()
            connection.close()

    @classmethod
    def mysqlfinishtask(self, nUserRole, nRightUserid):
        if nUserRole == 1:
            nsql = "select a.task_id,b.user_name,db_name,task_type,update_type,date_format(submit_time,'%Y-%m-%d %H:%i:%s'),is_inception_use,d.user_name,date_format(a.execute_time,'%Y-%m-%d %H:%i:%s') from sql_update_task_info a left join user_info  b on a.user_id=b.user_id left join db_server_info c on a.db_id=c.db_id left join user_info d on a.execute_user_id=d.user_id where task_type=1 and task_style=0 order by execute_time desc"
        else:
            nsql = "select a.task_id,b.user_name,db_name,task_type,update_type,date_format(submit_time,'%%Y-%%m-%%d %%H:%%i:%%s'),is_inception_use,d.user_name,date_format(a.execute_time,'%%Y-%%m-%%d %%H:%%i:%%s') from sql_update_task_info a left join user_info  b on a.user_id=b.user_id left join db_server_info c on a.db_id=c.db_id left join user_info d on a.execute_user_id=d.user_id join  user_db_relation e on a.user_id=e.user_id and a.db_id=e.db_id where task_type=1 and task_style=0 order by execute_time desc"
        cursor = connection.cursor()
        cursor.execute(nsql)
        rows = cursor.fetchall()
        cursor.close()
        jsonData = []
        for row in rows:
            result = {}
            result['taskid'] = row[0]
            result['submitusername'] = row[1]
            result['dbname'] = row[2]
            result['tasktype'] = row[3]
            result['updatetype'] = row[4]
            result['submittime'] = row[5]
            result['isinceptionuse'] = row[6]
            result['executeusername'] = row[7]
            result['executetime'] = row[8]
            jsonData.append(result)
        return jsonData

    @classmethod
    def tobeexecutemysqltask(self, nUserRole, nRightUserid):
        if nUserRole == 1:
            nsql = "select a.task_id,b.user_name,db_name,task_type,update_type,date_format(submit_time,'%Y-%m-%d %H:%i:%s'),is_inception_use,d.user_name,date_format(a.execute_time,'%Y-%m-%d %H:%i:%s') from sql_update_task_info a left join user_info  b on a.user_id=b.user_id left join db_server_info c on a.db_id=c.db_id left join user_info d on a.execute_user_id=d.user_id where task_type=0 and task_style=0 order by execute_time desc"
        else:
            nsql = "select a.task_id,b.user_name,db_name,task_type,update_type,date_format(submit_time,'%%Y-%%m-%%d %%H:%%i:%%s'),is_inception_use,d.user_name,date_format(a.execute_time,'%%Y-%%m-%%d %%H:%i:%%s') from sql_update_task_info a left join user_info  b on a.user_id=b.user_id left join db_server_info c on a.db_id=c.db_id left join user_info d on a.execute_user_id=d.user_id join  user_db_relation e on a.user_id=e.user_id and a.db_id=e.db_id where task_type=0 and task_style=0 order by execute_time desc"
        cursor = connection.cursor()
        cursor.execute(nsql)
        rows = cursor.fetchall()
        cursor.close()
        jsonData = []
        for row in rows:
            result = {}
            result['taskid'] = row[0]
            result['submitusername'] = row[1]
            result['dbname'] = row[2]
            result['tasktype'] = row[3]
            result['updatetype'] = row[4]
            result['submittime'] = row[5]
            result['isinceptionuse'] = row[6]
            result['executeusername'] = row[7]
            result['executetime'] = row[8]
            jsonData.append(result)
        return jsonData

    @classmethod
    def sqlcontentinfo(self, nTaskid):
        nsql = 'select task_id,sql_data from sql_update_task_info where task_id=%s'
        cursor = connection.cursor()
        cursor.execute(nsql, [nTaskid])
        rows = cursor.fetchone()
        cursor.close()
        jsonData = []
        result = {}
        result['taskid'] = rows[0]
        result['sqldata'] = rows[1]
        jsonData.append(result)
        return jsonData

    @classmethod
    def sqlcheckresult(self, nTaskid):
        nsql = "select task_id,check_id,check_stage,err_level,stage_status,error_messge,check_sql,affected_row,date_format(submit_datetime,'%%Y-%%m-%%d %%H:%%i:%%s') from sql_check_task_info where task_id=%s"
        cursor = connection.cursor()
        cursor.execute(nsql, [nTaskid])
        rows = cursor.fetchall()
        cursor.close()
        jsonData = []
        for row in rows:
            result = {}
            result['taskid'] = row[0]
            result['checkid'] = row[1]
            result['checkstage'] = row[2]
            result['errlevel'] = row[3]
            result['stagestatus'] = row[4]
            result['errormessge'] = row[5]
            result['checksql'] = row[6]
            result['affectedrow'] = row[7]
            result['submitdatetime'] = row[8]
            jsonData.append(result)
        return jsonData

    @classmethod
    def sqlexecresult(self, nTaskid):
        nsql = "select task_id,execute_id,execute_type,check_stage,err_level,stage_status,error_messge,check_sql,affected_row,date_format(submit_datetime,'%%Y-%%m-%%d %%H:%%i:%%s') from sql_update_task_result where task_id=%s"
        cursor = connection.cursor()
        cursor.execute(nsql, [nTaskid])
        rows = cursor.fetchall()
        cursor.close()
        jsonData = []
        for row in rows:
            result = {}
            result['taskid'] = row[0]
            result['executeid'] = row[1]
            result['executetype'] = row[2]
            result['checkstage'] = row[3]
            result['errlevel'] = row[4]
            result['stagestatus'] = row[5]
            result['errormessge'] = row[6]
            result['checksql'] = row[7]
            result['affectedrow'] = row[8]
            result['submitdatetime'] = row[9]
            jsonData.append(result)
        return jsonData

    @classmethod
    def sqltaskdelete(self, nTaskid):
        nsql = "delete a.*,b.* from sql_update_task_info a join sql_check_task_info b on a.task_id=b.task_id where a.task_id=%s"
        print nsql
        cursor = connection.cursor()
        cursor.execute(nsql, [nTaskid])
        cursor.close()
        connection.commit()
        connection.close()

    @classmethod
    def sqlcontentupdate(self, nTaskid, nDbid, nSqlcontent):
        nsql = "delete from sql_check_task_info where task_id=%s"
        cursor = connection.cursor()
        cursor.execute(nsql, [nTaskid])
        cursor.close()
        connection.commit()
        connection.close()

        nSql = "select if(b.use_outer_inner=2,b.outer_net,b.inner_net) as netip,db_port,db_user,db_passport,default_dbname from db_server_info a join server_info b on a.server_id=b.server_id where a.db_id = %s"
        cursor = connection.cursor()
        cursor.execute(nSql, [nDbid])
        rows = cursor.fetchone()
        cursor.close()

        nNet = rows[0]
        nDbport = int(rows[1])
        nDBuser = rows[2]
        nDballpripwd = rows[3]
        nTaskSql = "update sql_update_task_info set sql_data=%s where task_id =%s"
        cursor = connection.cursor()
        cursor.execute(nTaskSql, [nSqlcontent ,nTaskid])
        taskid = cursor.lastrowid
        cursor.close()
        connection.commit()
        connection.close()

        nIncepsql = '/*--user=%s;--password=%s;--host=%s;--enable-check;--port=%d;*/' % (
            nDBuser, nDballpripwd, nNet, nDbport) + '\n' \
                    + 'inception_magic_start;' + '\n' \
                    + nSqlcontent.encode('utf8') + '\n' \
                    + 'inception_magic_commit;'

        nIncepsql = nIncepsql.encode('utf-8').decode('latin-1')

        conn = MySQLdb.connect(host="127.0.0.1", user="root", passwd="12345678", db="Biz", port=6669)
        cursor = conn.cursor()
        cursor.execute(nIncepsql)
        result = cursor.fetchall()
        cursor.close()
        conn.close()
        for row in result:
            nCheckid = row[0]
            nCheckstage = row[1]
            nErrlevel = row[2]
            nStagestatus = row[3]
            nErrormessage = row[4].encode('utf8')
            nChecksql = row[5].encode('utf8')
            nAffectedrows = row[6]

            checkSql = 'insert into sql_check_task_info(task_id,check_id,check_stage,err_level,stage_status,error_messge,check_sql,affected_row) values (%s,%s,%s,%s,%s,%s,%s,%s)'
            cursor = connection.cursor()
            cursor.execute(checkSql,[taskid, nCheckid, nCheckstage, nErrlevel, nStagestatus, nErrormessage, nChecksql,nAffectedrows])
            cursor.close()
            connection.commit()
            connection.close()

    @classmethod
    def sqlexecbyinception(self, nTaskid, nRightUserid):
        nSql = "select if(b.use_outer_inner=2,b.outer_net,b.inner_net) as netip,db_port,db_user,db_passport,default_dbname,sql_data from db_server_info a join server_info b on a.server_id=b.server_id join sql_update_task_info c on a.db_id=c.db_id  where c.task_id=%s"
        cursor = connection.cursor()
        cursor.execute(nSql, [nTaskid])
        rows = cursor.fetchone()
        cursor.close()

        print nTaskid
        print nSql

        nNet = rows[0]
        nDbport = int(rows[1])
        nDBuser = rows[2]
        nDballpripwd = rows[3]
        nUpdatesql = rows[5]

        nIncepsql = '/*--user=%s;--password=%s;--host=%s;--enable-execute;--port=%d;*/' % (
        nDBuser, nDballpripwd, nNet, nDbport) + '\n' \
                    + 'inception_magic_start;' + '\n' \
                    + nUpdatesql + '\n' \
                    + 'inception_magic_commit;'

        nIncepsql = nIncepsql.encode('utf-8').decode('latin-1')

        conn = MySQLdb.connect(host='127.0.0.1', user='root', passwd='123456', db='mysql', port=6669, charset="utf8")
        cursor = conn.cursor()
        cursor.execute(nIncepsql)
        result = cursor.fetchall()
        cursor.close()
        conn.close()
        for row in result:
            nCheckid = row[0]
            nCheckstage = row[1]
            nErrlevel = row[2]
            nStagestatus = row[3]
            nErrormessage = row[4].encode('utf8')
            nChecksql = row[5].encode('utf8')
            nAffectedrows = row[6]

            checkSql = 'insert into sql_update_task_result (task_id,execute_id,execute_type,check_stage,err_level,stage_status,error_messge,check_sql,affected_row) values (%s,%s,2,%s,%s,%s,%s,%s,%s)'
            cursor = connection.cursor()
            cursor.execute(checkSql, [nTaskid, nCheckid, nCheckstage, nErrlevel, nStagestatus, nErrormessage, nChecksql,
                                      nAffectedrows])
            cursor.close()
            connection.commit()
            connection.close()

        updatetypesql = 'update sql_update_task_info set task_type=1,is_inception_use=2,execute_user_id=%s where task_id=%s'
        cursor = connection.cursor()
        cursor.execute(updatetypesql, [nRightUserid, nTaskid])
        cursor.close()
        connection.commit()
        connection.close()

    @classmethod
    def sqlexecnoince(self, nTaskid, nRightUserid):
        nSqldata = "select if(b.use_outer_inner=2,b.outer_net,b.inner_net) as netip,db_port,db_user,db_passport,default_dbname,sql_data from db_server_info a join server_info b on a.server_id=b.server_id join sql_update_task_info c on a.db_id=c.db_id  where c.task_id=%s"
        cursor = connection.cursor()
        cursor.execute(nSqldata, [nTaskid])
        rows = cursor.fetchone()

        nNet = rows[0]
        nDbport = int(rows[1])
        nDBuser = rows[2]
        nDballpripwd = rows[3]
        nDefaultdbname = rows[4]
        nUpdatesql = rows[5].encode(encoding='UTF-8')

        try:
            conn = MySQLdb.connect(host=nNet, user=nDBuser, passwd=nDballpripwd, db=nDefaultdbname, port=nDbport,charset='utf8')
            cursor = conn.cursor()
            cursor.execute(nUpdatesql)
            cursor.close()
            conn.commit()
            resultdata = cursor.rowcount

        except MySQLdb.Error, e:
            resultdata = "Mysql Error %d: %s" % (e.args[0], e.args[1])

        updatetypesql = 'update sql_update_task_info set task_type=1,is_inception_use=1,execute_user_id=%s where task_id=%s'
        cursor = connection.cursor()
        cursor.execute(updatetypesql, [nRightUserid, nTaskid])
        cursor.close()
        connection.commit()

        updatesqlresult = 'insert into  sql_update_task_result (task_id,execute_id,execute_type,check_sql,sql_execute_info) values (%s,1,1,%s,%s)'
        cursor = connection.cursor()
        cursor.execute(updatesqlresult, [nTaskid, nUpdatesql, resultdata])
        cursor.close()
        connection.commit()
        connection.close()