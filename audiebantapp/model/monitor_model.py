#!/usr/bin/env python
# -*- coding: utf-8 -*-
# create by zhangsp 2017-70-26
# 用户全线增删改查

from django.db import connection


class Mmonitor(object):
    def __init__(self, nDbid, nBegintime, nEndtime):
        self.nDbid = nDbid
        self.nBegintime = nBegintime
        self.nEndtime = nEndtime

    @classmethod
    def redislist(self):
        nsql = "select a.db_id,b.db_name,redis_role,b.db_port,if(c.use_outer_inner=2,c.outer_net,c.inner_net),a.status,date_format(a.update_time,'%Y-%m-%d %H:%i:%s') from redis_status a left join db_server_info b on a.db_id=b.db_id left join server_info c on b.server_id=c.server_id order by a.update_time"
        cursor = connection.cursor()
        cursor.execute(nsql)
        rows = cursor.fetchall()
        cursor.close()
        jsonData = []
        for row in rows:
            result = {}
            result['dbid'] = row[0]
            result['dbname'] = row[1]
            result['redisrole'] = row[2]
            result['dbport'] = row[3]
            result['hostip'] = row[4]
            result['status'] = row[5]
            result['updatetime'] = row[6]
            jsonData.append(result)
        return jsonData


    @classmethod
    def redisinfo(self,nDbid):
        nsql = "select a.db_id,b.db_name,redis_role,b.db_port,a.status,round(uptime_in_seconds/3600/24,2),connected_clients,round(used_memory_rss/used_memory*100,2),used_cpu,redis_keys from redis_status a left join db_server_info b on a.db_id=b.db_id where a.db_id=%s order by a.update_time"
        cursor = connection.cursor()
        cursor.execute(nsql, [nDbid])
        row = cursor.fetchone()
        cursor.close()
        jsonData = []
        result = {}
        result['dbid'] = row[0]
        result['dbname'] = row[1]
        result['redisrole'] = row[2]
        result['dbport'] = row[3]
        result['status'] = row[4]
        result['uptimeindays'] = row[5]
        result['connectedclients'] = row[6]
        result['usedmemory'] = row[7]
        result['usedcpu'] = row[8]
        result['rediskeys'] = row[9]
        jsonData.append(result)
        return jsonData

    @classmethod
    def datagrephvieprocessllist(self,nDbid, nBegintime, nEndtime):
        nsql = "select a.id,round((a.total_commands_processed=b.total_commands_processed)/(unix_timestamp(a.create_time)-unix_timestamp(b.create_time)),2),date_format(a.create_time,'%%Y-%%m-%%d %%H:%%i:%%s') from (select id,total_commands_processed,create_time from redis_status_history where create_time>=%s and create_time<=%s and db_id=%s) a join (select id+1 as id,total_commands_processed,create_time from redis_status_history where create_time>=%s and create_time<=%s and db_id=%s)  b on a.id=b.id"
        cursor = connection.cursor()
        cursor.execute(nsql,[nBegintime, nEndtime, nDbid, nBegintime, nEndtime, nDbid])
        rows = cursor.fetchall()
        cursor.close()
        jsonData = []
        for row in rows:
            result = {}
            result['dbid'] = row[0]
            result['processlistnum'] = int(row[1])
            result['createtime'] = row[2]
            jsonData.append(result)
        return jsonData


    @classmethod
    def datagrephviewmen(self, nDbid, nBegintime, nEndtime):
        nsql = "select id,used_memory,used_memory_rss,date_format(create_time,'%%Y-%%m-%%d %%H:%%i:%%s') from redis_status_history where create_time>=%s and create_time<=%s and db_id=%s"
        cursor = connection.cursor()
        cursor.execute(nsql, [nBegintime, nEndtime, nDbid])
        rows = cursor.fetchall()
        cursor.close()
        jsonData = []
        for row in rows:
            result = {}
            result['dbid'] = row[0]
            result['usedmemory'] = row[1]
            result['usedmemoryrss'] = row[2]
            result['createtime'] = row[3]
            jsonData.append(result)
        return jsonData

    @classmethod
    def mysqllist(self):
        nsql = "select a.db_id,b.db_name,redis_role,b.db_port,if(c.use_outer_inner=2,c.outer_net,c.inner_net),a.status,date_format(a.update_time,'%Y-%m-%d %H:%i:%s') from mysql_status a left join db_server_info b on a.db_id=b.db_id left join server_info c on b.server_id=c.server_id order by a.update_time"
        cursor = connection.cursor()
        cursor.execute(nsql)
        rows = cursor.fetchall()
        cursor.close()
        jsonData = []
        for row in rows:
            result = {}
            result['dbid'] = row[0]
            result['dbname'] = row[1]
            result['redisrole'] = row[2]
            result['dbport'] = row[3]
            result['hostip'] = row[4]
            result['status'] = row[5]
            result['updatetime'] = row[6]
            jsonData.append(result)
        return jsonData