#!/usr/bin/env python
# -*- coding: utf-8 -*-
# create by zhangsp 2017-70-26
# 用户全线增删改查

import sys
import commands
import datetime
import MySQLdb
import redis
from django.db import connection
reload(sys)

class MysqlAdvisor(object):

    def __init__(self, nUserRole, nRightUserid, nDbid, nSqlcontent, nTaskid, nAid):
        self.nUserRole = nUserRole
        self.nRightUserid = nRightUserid
        self.nDbid = nDbid
        self.nSqlcontent = nSqlcontent
        self.nTaskid = nTaskid
        self.nAid = nAid

    @classmethod
    def mysqladvisorlist(self, nUserRole, nRightUserid):
        if nUserRole == 1:
             nsql = "select a.id,a.db_id,b.db_name,b.server_id,c.server_name,b.db_server_type,b.db_type,db_port,b.db_user,if(c.use_outer_inner=2,c.outer_net,c.inner_net),date_format(b.create_time,'%Y-%m-%d %H:%i:%s'),b.default_dbname,sql_content,result_content from sql_advice_info a left join db_server_info b on a.db_id=b.db_id left join server_info c on b.server_id=c.server_id where b.db_type=1 order by b.db_type,b.create_time"
        else:
            nsql = "select a.id,a.db_id,b.db_name,b.server_id,c.server_name,b.db_server_type,b.db_type,db_port,b.db_user,if(c.use_outer_inner=2,c.outer_net,c.inner_net),date_format(b.create_time,'%%Y-%%m-%%d %%H:%%i:%%s'),b.default_dbname,sql_content,result_content from sql_advice_info a left join db_server_info b on a.db_id=b.db_id left join server_info c on b.server_id=c.server_id join user_db_relation d on c.db_id=d.db_id where b.db_type=1 and d.userid=%s order by b.db_type,b.create_time" % (nRightUserid)
        cursor = connection.cursor()
        cursor.execute(nsql)
        rows = cursor.fetchall()
        cursor.close()
        jsonData = []
        for row in rows:
            result = {}
            result['id'] = row[0]
            result['dbid'] = row[1]
            result['dbname'] = row[2]
            result['serverid'] = row[3]
            result['servername'] = row[4]
            result['dbservertype'] = row[5]
            result['dbtype'] = row[6]
            result['dbport'] = row[7]
            result['dbuser'] = row[8]
            result['dbnet'] = row[9]
            result['createtime'] = row[10]
            result['deafultdbname'] = row[11]
            result['sql_content'] = row[12]
            jsonData.append(result)
        return jsonData

    @classmethod
    def sqladvisor(self, nDbid, nSqlcontent, nUserid):

        nsql = "select db_id,db_port,if(b.use_outer_inner=2,b.outer_net,b.inner_net),default_dbname,db_user,db_passport from db_server_info a join server_info b on b.server_id=a.server_id where  db_id=%s " % (nDbid)
        cursor = connection.cursor()
        cursor.execute(nsql)
        rows = cursor.fetchone()
        cursor.close()
        nDbid = rows[0]
        nDbport = rows[1]
        nNet = rows[2]
        nDefaultdbname = rows[3]
        nDbuser = rows[4]
        nDbpassword = rows[5]

        shelldata = "sqladvisor -h %s  -P %s  -u %s -p %s -d %s -q \'%s\' -v 1" % (nNet, nDbport, nDbuser, nDbpassword, nDefaultdbname, nSqlcontent)
        print shelldata
        nContent = commands.getoutput(shelldata)

        insertsqlresult = 'insert into  sql_advice_info (db_id,sql_content,result_content) values (%s,%s,%s)'
        cursor = connection.cursor()
        cursor.execute(insertsqlresult, [nDbid, nSqlcontent, nContent])
        cursor.close()
        connection.commit()
        connection.close()

    @classmethod
    def mysqladvisorresult(self, nId):
        nsql = "select a.id,a.db_id,b.db_name,b.server_id,c.server_name,b.db_server_type,b.db_type,db_port,b.db_user,if(c.use_outer_inner=2,c.outer_net,c.inner_net),date_format(b.create_time,'%Y-%m-%d %H:%i:%s'),b.default_dbname,sql_content,result_content from sql_advice_info a left join db_server_info b on a.db_id=b.db_id left join server_info c on b.server_id=c.server_id where b.db_type=1 order by b.db_type,b.create_time"
        cursor = connection.cursor()
        cursor.execute(nsql)
        rows = cursor.fetchall()
        cursor.close()
        jsonData = []
        for row in rows:
            result = {}
            result['id'] = row[0]
            result['dbid'] = row[1]
            result['dbname'] = row[2]
            result['serverid'] = row[3]
            result['servername'] = row[4]
            result['dbservertype'] = row[5]
            result['dbtype'] = row[6]
            result['dbport'] = row[7]
            result['dbuser'] = row[8]
            result['dbnet'] = row[9]
            result['createtime'] = row[10]
            result['deafultdbname'] = row[11]
            result['sql_content'] = row[12]
            jsonData.append(result)
        return jsonData

    @classmethod
    def mysqladvisorinfo(self, nId):
        nsql = "select a.id,a.db_id,sql_content,b.db_name,result_content from sql_advice_info a join db_server_info b on a.db_id=b.db_id where a.id=%s"
        cursor = connection.cursor()
        cursor.execute(nsql, [nId])
        rows = cursor.fetchone()
        cursor.close()
        jsonData = []
        result = {}
        result['id'] = rows[0]
        result['dbid'] = rows[1]
        result['sqlcontent'] = rows[2]
        result['dbname'] = rows[3]
        result['sqlreulst'] = rows[4]
        jsonData.append(result)
        return jsonData