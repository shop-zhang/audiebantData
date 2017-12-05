#!/usr/bin/env python
# -*- coding: utf-8 -*-
# create by zhangsp 2017-70-26
# 用户全线增删改查

from django.db import connection


class Right(object):
    def __init__(self, username, npwd, nuserrole, nRightname, nMenuid, nAction, nStatus, nRightid, nRightUserid, nUrldata, nRightuserid, nRightuserrole):
        self.username = username
        self.npwd = npwd
        self.nRightname = nRightname
        self.nMenuid = nMenuid
        self.nAction = nAction
        self.nStatus = nStatus
        self.nuserrole = nuserrole
        self.nRightid = nRightid
        self.nRightUserid = nRightUserid
        self.nUrldata = nUrldata
        self.nRightuserid = nRightuserid
        self.nRightuserrole = nRightuserrole

    @classmethod
    def rightlist(self):
        nsql="select a.rightsid,a.rightsname,a.menuid,b.menuname,a.parentid,if(c.menuname is null,'',c.menuname),if(a.action is null,'',a.action),a.status,date_format(a.create_time,'%Y-%m-%d %H:%i:%s'),date_format(a.update_time,'%Y-%m-%d %H:%i:%s') from menu_rights a join menu_info b on a.menuid=b.menuid left join menu_info c on a.parentid=c.menuid where a.status=1 order by a.parentid,a.menuid"
        cursor = connection.cursor()
        cursor.execute(nsql)
        rows = cursor.fetchall()
        cursor.close()
        jsonData = []
        for row in rows:
            result= {}
            result['rightsid'] = row[0]
            result['rightsname'] = row[1]
            result['menuid'] = row[2]
            result['menuname'] = row[3]
            result['parentid'] = row[4]
            result['parentname'] = row[5]
            result['action'] = row[6]
            result['status'] = row[7]
            result['create_time'] = row[8]
            result['update_time'] = row[9]
            jsonData.append(result)
        return jsonData

    @classmethod
    def rightbeforeadd(self):
        nsql = "select menuid,menuname from menu_info group by menuid"
        cursor = connection.cursor()
        cursor.execute(nsql)
        rows = cursor.fetchall()
        cursor.close()
        jsonData = []
        for row in rows:
            result = {}
            result['menuid'] = row[0]
            result['menuname'] = row[1]
            jsonData.append(result)
        return jsonData

    @classmethod
    def rightadd(self, nRightname, nAction, nStatus, nMneuid):
        nsql = "insert into menu_rights (`menuid`,`parentid`,`rightsname`,`action`,`status`,`create_time`,`update_time`) select  menuid,parentid,%s,%s,%s,now(),now() from menu_info where menuid=%s"
        cursor = connection.cursor()
        cursor.execute(nsql, [nRightname, nAction, nStatus, nMneuid])
        cursor.close()
        connection.commit()
        connection.close()

    @classmethod
    def rightbeforeupdate(self, nRightid):
        nsql = "select a.rightsid,rightsname,a.menuid,a.action,a.status from menu_rights a join menu_info b on a.menuid=b.menuid where a.rightsid=%s"
        cursor = connection.cursor()
        cursor.execute(nsql, [nRightid])
        rows = cursor.fetchone()
        cursor.close()
        jsonData = []
        result = {}
        result['rightsid'] = rows[0]
        result['rightsname'] = rows[1]
        result['menuid'] = rows[2]
        result['action'] = rows[3]
        result['status'] = rows[4]
        jsonData.append(result)
        return jsonData

    @classmethod
    def rightupdate(self, nRightname, nAction, nStatus, nMenuid, nRightid):
        print nRightname, nAction, nStatus, nMenuid, nRightid
        nsql = "update  menu_rights set rightsname=%s,action=%s,status=%s,menuid=%s,parentid=if((select parentid from menu_info where menuid=%s) is null,'',(select parentid from menu_info where menuid=%s)) where rightsid=%s "
        cursor = connection.cursor()
        cursor.execute(nsql, [nRightname, nAction, nStatus, nMenuid, nMenuid, nMenuid, nRightid])
        cursor.close()
        connection.commit()
        connection.close()

    @classmethod
    def rightdelete(self, nRightid):
        nsql = "delete from menu_rights where rightsid=%s"
        cursor = connection.cursor()
        cursor.execute(nsql, [nRightid])
        connection.commit()
        connection.close()



    @classmethod
    def leftmenuright(self, nRightuserid, nRightuserrole):
        if nRightuserrole == 1:
            nsql = "select menuid,menuname,action,style_type from menu_info where status=1 and parentid=0 order by sort"
            cursor = connection.cursor()
            cursor.execute(nsql)
            rows = cursor.fetchall()
            cursor.close()
            jsonData = []
            num = 1
            for row in rows:
                result = {}
                result['id'] = num
                result['menuid'] = row[0]
                result['menuname'] = row[1]
                result['action'] = row[2]
                result['style_type'] = row[3]
                nparentid = row[0]
                nsql2 = "select menuid,menuname,action from menu_info where status=1 and parentid=%d order by sort" % (
                nparentid)
                cursor = connection.cursor()
                cursor.execute(nsql2)
                sonrows = cursor.fetchall()
                cursor.close()
                jsonData1 = []
                for sonrow in sonrows:
                    result1 = {}
                    result1['sonmenuid'] = sonrow[0]
                    result1['sonmenuname'] = sonrow[1]
                    result1['sonaction'] = sonrow[2]
                    jsonData1.append(result1)
                result['sencond_menu'] = jsonData1
                lennum = len(jsonData1)
                result['lennum'] = lennum
                jsonData.append(result)
                num = num + 1
            return jsonData
        else:
            nsql = "select a.menuid,a.menuname,a.action,a.style_type from menu_info a join menu_rights b on a.menuid=b.menuid join user_right_relation c on b.rightsid=c.rightid where a.status=1 and a.parentid=0 and c.userid=%s order by a.sort"
            cursor = connection.cursor()
            cursor.execute(nsql,[nRightuserid])
            rows = cursor.fetchall()
            cursor.close()
            jsonData = []
            num = 1
            for row in rows:
                result = {}
                result['id'] = num
                result['menuid'] = row[0]
                result['menuname'] = row[1]
                result['action'] = row[2]
                result['style_type'] = row[3]
                nparentid = row[0]
                nsql2="select a.menuid,a.menuname,a.action from menu_info a join menu_rights b on a.menuid=b.menuid join user_right_relation c on b.rightsid=c.rightid and c.userid=%s  where a.status=1 and a.parentid=%s group by a.menuid"
                cursor = connection.cursor()
                cursor.execute(nsql2, [nRightuserid, nparentid])
                sonrows = cursor.fetchall()
                cursor.close()
                jsonData1 = []
                for sonrow in sonrows:
                    result1 = {}
                    result1['sonmenuid'] = sonrow[0]
                    result1['sonmenuname'] = sonrow[1]
                    result1['sonaction'] = sonrow[2]
                    jsonData1.append(result1)
                result['sencond_menu'] = jsonData1
                lennum = len(jsonData1)
                result['lennum'] = lennum
                jsonData.append(result)
                num=num+1
            return jsonData


    @classmethod
    def userrightcheck(self, nRightUserid, nUrldata):
        if nRightUserid == 1:
            jsonData = []
            result1 = {}
            result1['num'] = 1
            jsonData.append(result1)
            return jsonData
        else:
            nsql = "select count(*) from user_right_relation a join menu_rights b on a.rightid=b.rightsid where a.userid=%s and b.action=%s"
            cursor = connection.cursor()
            cursor.execute(nsql, [nRightUserid, nUrldata])
            rows = cursor.fetchall()
            cursor.close()
            jsonData = []
            for row in rows:
                result1 = {}
                result1['num'] = row[0]
                jsonData.append(result1)
            return jsonData


    @classmethod
    def getrightusers(self, nRightUserid):
        if nRightUserid ==0:
            nsql = "select user_id,user_name,login_name from user_info a left join user_right_relation b on a.user_id=b.userid where user_role!=1 and is_forbid=1 and b.userid is null group by a.user_id"
            #pnsql="select user_id,user_name,login_name from user_info"
            cursor = connection.cursor()
            cursor.execute(nsql)
            rows = cursor.fetchall()
            cursor.close()
            jsonData = []
            for row in rows:
                result = {}
                result['user_id'] = row[0]
                result['user_name'] = row[1]
                result['login_name'] = row[2]
                jsonData.append(result)
            return jsonData
        else:
            nsql = "select user_id,user_name,login_name from user_info where user_id=%s and is_forbid=1"
            cursor = connection.cursor()
            cursor.execute(nsql, [nRightUserid])
            rows = cursor.fetchall()
            cursor.close()
            jsonData = []
            for row in rows:
                result = {}
                result['user_id'] = row[0]
                result['user_name'] = row[1]
                result['login_name'] = row[2]
                jsonData.append(result)
            return jsonData


    @classmethod
    def getallright(self, nRightuserid):
        nsql = "select rightsid,rightsname,menuid,parentid,if(b.userid is null,0,1) as ischecked from menu_rights  a left join user_right_relation b on a.rightsid=b.rightid and b.userid=%s where parentid=0"
        cursor = connection.cursor()
        cursor.execute(nsql,[nRightuserid])
        rows = cursor.fetchall()
        cursor.close()
        jsonData = []
        for row in rows:
            result = {}
            result['rightsid'] = row[0]
            result['rightsname'] = row[1]
            result['menuid'] = row[2]
            result['ischecked'] = row[4]
            nMenuid=row[2]
            nsqlone = "select a.rightsid,a.rightsname,a.menuid,a.parentid,if(c.userid is null,0,1) as ischecked  from menu_rights a join menu_info b on a.menuid=b.menuid left join user_right_relation c on a.rightsid=c.rightid and c.userid=%s where a.parentid!=0 and a.action='' and a.parentid=%s  order by a.parentid"
            cursor = connection.cursor()
            cursor.execute(nsqlone, [nRightuserid, nMenuid])
            rowsone = cursor.fetchall()
            cursor.close()
            jsonDataOne = []
            for rowone in rowsone:
                resultone = {}
                resultone['rightsid'] = rowone[0]
                resultone['rightsname'] = rowone[1]
                resultone['menuid'] = rowone[2]
                resultone['parentid'] = rowone[3]
                resultone['ischecked'] = rowone[4]
                nMenuidTwo = rowone[2]
                print nMenuidTwo
                nsqltwo= "select a.rightsid,a.rightsname,a.menuid,a.parentid,if(c.userid is null,0,1) as  ischecked from menu_rights a join menu_info b on a.menuid=b.menuid left join user_right_relation c on a.rightsid=c.rightid and c.userid=%s where a.parentid!=0 and a.action!='' and a.menuid=%s order by a.parentid"
                cursor = connection.cursor()
                cursor.execute(nsqltwo, [nRightuserid, nMenuidTwo])
                rowstwo = cursor.fetchall()
                cursor.close()
                jsonDataTwo = []
                for rowtwo in rowstwo:
                    resulttwo = {}
                    resulttwo['rightsid'] = rowtwo[0]
                    resulttwo['rightsname'] = rowtwo[1]
                    resulttwo['menuid'] = rowtwo[2]
                    resulttwo['parentid'] = rowtwo[3]
                    resulttwo['ischecked'] = rowtwo[4]
                    jsonDataTwo.append(resulttwo)
                resultone['menutwoinfo'] = jsonDataTwo
                jsonDataOne.append(resultone)
            result['menuoneinfo'] = jsonDataOne
            jsonData.append(result)
            print jsonData
        return jsonData

    @classmethod
    def userrightupdate(self, nRightuserid,nRightidList):
        nsqldelete = "delete from  user_right_relation where userid=%s"
        cursor = connection.cursor()
        cursor.execute(nsqldelete, [nRightuserid])
        connection.commit()
        connection.close()

        for nRightid in nRightidList:
            nsql = "replace into user_right_relation (`userid`,`rightid`) values (%s,%s)"
            cursor = connection.cursor()
            cursor.execute(nsql, [nRightuserid, nRightid])
            connection.commit()
            connection.close()