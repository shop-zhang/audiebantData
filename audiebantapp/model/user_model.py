#!/usr/bin/env python
#-*- coding: utf-8 -*-
# create by zhangsp 2017-70-26

from django.db import connection

class User(object):
    def __init__(self,nLoginname, nLoginpwd, nUsername, nUseremail, nUsermobile, nUserrole, nUserdepartment, nStatus, nUserid):
        self.nLoginname = nLoginname
        self.nLoginpwd = nLoginpwd
        self.nUsername = nUsername
        self.nUseremail = nUseremail
        self.nUsermobile = nUsermobile
        self.nUserdepartment = nUserdepartment
        self.nUserrole = nUserrole
        self.nStatus = nStatus
        self.nUserid = nUserid

    # 获取所有有效user列表
    @classmethod
    def userlist(self):
        nsql="select user_id,login_name,user_name,user_email,user_mobile,user_role,user_department,is_forbid,date_format(create_time,'%Y-%m-%d %H:%i:%s'),date_format(update_time,'%Y-%m-%d %H:%i:%s') from user_info"
        cursor = connection.cursor()
        cursor.execute(nsql)
        rows = cursor.fetchall()
        cursor.close()
        jsonData = []
        for row in rows:
            result = {}
            result['user_id'] = row[0]
            result['login_name'] = row[1]
            result['user_name'] = row[2]
            result['user_email'] = row[3]
            result['user_mobile'] = row[4]
            result['user_role'] = row[5]
            result['user_department'] = row[6]
            result['is_forbid'] = row[7]
            result['create_time'] = row[8]
            result['update_time'] = row[9]
            jsonData.append(result)
        return jsonData

    @classmethod
    def useradd(self, nLoginname, nLoginpwd, nUsername, nUseremail, nUsermobile, nUserrole, nUserdepartment, nStatus):
        nsql = "insert into user_info (`login_name`,`login_pwd`,`user_name`,`user_email`,`user_mobile`,`user_role`,`user_department`,`is_forbid`) values (%s,md5(%s),%s,%s,%s,%s,%s,%s)"
        cursor = connection.cursor()
        cursor.execute(nsql, [nLoginname, nLoginpwd, nUsername, nUseremail, nUsermobile, nUserrole, nUserdepartment, nStatus])
        cursor.close()
        connection.commit()
        connection.close()

    @classmethod
    def userbeforeupdate(self, nUserid):
        nsql = "select login_name,login_pwd,user_name,user_email,user_mobile,user_role,user_department,is_forbid from user_info where user_id=%s"
        cursor = connection.cursor()
        cursor.execute(nsql, [nUserid])
        rows = cursor.fetchone()
        cursor.close()
        jsonData = []
        result = {}
        result['userid'] = nUserid
        result['login_name'] = rows[0]
        result['login_pwd'] = rows[1]
        result['user_name'] = rows[2]
        result['user_email'] = rows[3]
        result['user_mobile'] = rows[4]
        result['user_role'] = rows[5]
        result['user_department'] = rows[6]
        result['is_forbid'] = rows[7]
        jsonData.append(result)
        return jsonData

    @classmethod
    def userupdate(self, nLoginname, nLoginpwd, nUsername, nUseremail, nUsermobile, nUserdepartment, nUserrole, nStatus, nUserid):
        nsql = "update user_info set login_name=%s,login_pwd=md5(%s),user_name=%s,user_email=%s,user_mobile=%s,user_department=%s,user_role=%s,is_forbid=%s where user_id=%s"
        cursor = connection.cursor()
        cursor.execute(nsql, [nLoginname, nLoginpwd, nUsername, nUseremail, nUsermobile, nUserdepartment, nUserrole, nStatus, nUserid])
        cursor.close()
        connection.commit()
        connection.close()

    @classmethod
    def userdelete(self, nUserid):
        nsql = "delete from user_info where user_id=%s"
        cursor = connection.cursor()
        cursor.execute(nsql, [nUserid])
        connection.commit()
        connection.close()

    @classmethod
    def getUserIdbyUsername(self, nUsername):
        nsql = "select user_id from user_info where login_name like %s"
        cursor = connection.cursor()
        cursor.execute(nsql, [nUsername])
        rows = cursor.fetchone()
        cursor.close()
        nUserid=rows[0]
        return nUserid