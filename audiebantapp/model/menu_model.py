#!/usr/bin/env python
#-*- coding: utf-8 -*-
# create by zhangsp 2017-70-26

from django.db import connection

class Memu(object):
    def __init__(self, username, npwd, nMenuid, nMenuname, nParentid, nAction, nStyletype, nStatus, nOrdersort):
        self.username = username
        self.npwd = npwd
        self.nMenuid = nMenuid
        self.nMenuname = nMenuname
        self.nParentid = nParentid
        self.nStyletype = nStyletype
        self.nStatus = nStatus
        self.nOrdersort = nOrdersort
        self.nAction = nAction

    # 获取所有有效menus列表
    @classmethod
    def menulist(self):
        nsql="select a.menuid,a.parentid,if(b.menuname is null,'',b.menuname),a.menuname,a.action,a.sort,a.style_type,a.status,date_format(a.create_time,'%Y-%m-%d %H:%i:%s'),date_format(a.update_time,'%Y-%m-%d %H:%i:%s') from menu_info a left join menu_info b on a.parentid=b.menuid where a.status=1"
        cursor = connection.cursor()
        cursor.execute(nsql)
        rows = cursor.fetchall()
        cursor.close()
        jsonData = []
        for row in rows:
            result = {}
            result['menuid'] = row[0]
            result['parentid'] = row[1]
            result['parent_menuname'] = row[2]
            result['menuname'] = row[3]
            result['action'] = row[4]
            result['sort'] = row[5]
            result['style_type'] = row[6]
            result['status'] = row[7]
            result['create_time'] = row[8]
            result['update_time'] = row[9]
            jsonData.append(result)
        return jsonData

    @classmethod
    def menubeforeadd(self):
        nsql = "select menuid,menuname from menu_info  where parentid=0 group by menuid union select 0,'无'"
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
    def menuadd(self, nMenuname, nParentid, nAction, nStyletype, nStatus, nOrdersort):
        if not nStyletype.strip():
            nStyletype = ''
        nsql = "insert into menu_info (`parentid`,`menuname`,`action`,`sort`,`style_type`,`status`) values (%s,%s,%s,%s,%s,%s)"
        cursor = connection.cursor()
        cursor.execute(nsql, [nParentid, nMenuname, nAction, nOrdersort, nStyletype, nStatus])
        cursor.close()
        connection.commit()
        connection.close()

    @classmethod
    def menubeforeupdate(self, nMenuid):
        nsql = "select menuid,parentid,menuname,action,sort,style_type,status from menu_info where menuid=%s"
        cursor = connection.cursor()
        cursor.execute(nsql, [nMenuid])
        rows= cursor.fetchone()
        cursor.close()
        jsonData = []
        result = {}
        result['menuid'] = rows[0]
        result['parentid'] = rows[1]
        result['menuname'] = rows[2]
        result['action'] = rows[3]
        result['sort'] = rows[4]
        result['style_type'] = rows[5]
        result['status'] = rows[6]
        jsonData.append(result)
        return jsonData

    @classmethod
    def menuupdate(self, nMenuid, nMenuname, nParentid, nAction, nStyletype, nStatus, nOrdersort):
        print nParentid
        if not nStyletype.strip():
            nStyletype = ''
        nsql = "update  menu_info set `parentid`=%s,`menuname`=%s,`action`=%s,`sort`=%s,`style_type`=%s,`status`=%s where menuid=%s"
        cursor = connection.cursor()
        cursor.execute(nsql, [nParentid, nMenuname, nAction, nOrdersort, nStyletype, nStatus, nMenuid])
        cursor.close()
        connection.commit()
        connection.close()

    @classmethod
    def menudelete(self, nMenuid):
        nsql = "delete from menu_info where menuid=%s "
        cursor = connection.cursor()
        cursor.execute(nsql, [nMenuid])
        connection.commit()
        connection.close()