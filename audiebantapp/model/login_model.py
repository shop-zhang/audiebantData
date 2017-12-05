#!/usr/bin/env python
#-*- coding: utf-8 -*-
# create by zhangsp 2017-07-19
# 登录model获取

from django.db import connection

class Login(object):
    def __init__(self, username, npwd, nUserid, nPasswd):
        self.username = username
        self.npwd = npwd
        self.nUserid = nUserid
        self.nPasswd = nPasswd

    @classmethod
    def checklogindata(self,username,npwd):
        nsql='select count(*) as num from user_info where login_name=%s and login_pwd=md5(%s)'
        cursor = connection.cursor()
        cursor.execute(nsql,[username, npwd])
        rows = cursor.fetchone()
        cursor.close()
        jsonData = []
        result = {}
        result['num'] = rows[0]
        jsonData.append(result)
        return jsonData

    @classmethod
    def usersessiondata(self, username, npwd):
        nsql = 'select user_id as userid,user_role as userrole,is_forbid as isforbid from user_info where login_name=%s and login_pwd=md5(%s)'
        cursor = connection.cursor( )
        cursor.execute( nsql, [username, npwd])
        rows = cursor.fetchone( )
        cursor.close( )
        jsonData = []
        result = {}
        result['userid'] = rows[0]
        result['userrole'] = rows[1]
        result['isforbid'] = rows[2]
        jsonData.append(result)
        return jsonData


    @classmethod
    def updatepwd(self, nPasswd, nUserid):
        nsql = "update user_info set login_pwd=md5(%s) where user_id=%s"
        cursor = connection.cursor()
        cursor.execute(nsql, [nPasswd, nUserid])
        cursor.close()
        connection.commit()
        connection.close()