#!/usr/bin/env python
# -*- coding: utf-8 -*-
# create by zhangsp 2017-70-26
# 用户全线增删改查

import sys
import MySQLdb
from django.db import connection
reload(sys)


class MysqlBackup(object):

    def __init__(self, nUserRole, nRightUserid, nDbid, nSqlcontent, nTaskid):
        self.nUserRole = nUserRole
        self.nRightUserid = nRightUserid
        self.nDbid = nDbid
        self.nSqlcontent = nSqlcontent
        self.nTaskid = nTaskid

    @classmethod
    def mysqlbackuplist(self, nUserRole, nRightUserid):
        if nUserRole == 1:
            nsql = "select a.db_id,b.db_name,back_status,back_type,(unix_timestamp(backup_end_time)-unix_timestamp(a.backup_start_time)) as backup_time,backup_size,backup_md5sum,backup_store_url,store_server_url,is_complate,backup_recovery_time from db_backup_info a join db_server_info b on a.db_id=b.db_id join (select max(backup_start_time) as backup_start_time from db_backup_info group by db_id) c on a.backup_start_time=c.backup_start_time"
        else:
            nsql = "select a.db_id,b.db_name,back_status,back_type,(unix_timestamp(backup_end_time)-unix_timestamp(a.backup_start_time)) as backup_time,backup_size,backup_md5sum,backup_store_url,store_server_url,is_complate,backup_recovery_time from db_backup_info a join db_server_info b on a.db_id=b.db_id join (select max(backup_start_time) as backup_start_time from db_backup_info group by db_id) c on a.backup_start_time=c.backup_start_time join user_db_relation d on a.db_id=d.db_id where a.db_type=1 and d.userid=%s"   % (nRightUserid)
        cursor = connection.cursor()
        cursor.execute(nsql)
        rows = cursor.fetchall()
        cursor.close()
        jsonData = []
        for row in rows:
            result = {}
            result['dbid'] = row[0]
            result['dbname'] = row[1]
            result['backstatus'] = row[2]
            result['backtype'] = row[3]
            result['backuptime'] = row[4]
            result['backupsize'] = row[5]
            result['backupmd5sum'] = row[6]
            result['backupstoreurl'] = row[7]
            result['storeserverurl'] = row[8]
            result['iscomplate'] = row[9]
            result['backup_recovery_time'] = row[10]
            jsonData.append(result)
        return jsonData