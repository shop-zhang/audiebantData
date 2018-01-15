#!/usr/bin/python
import commands
import datetime
import MySQLdb
import redis
from django.db import connection

def mysql_monitor_job():
    nsql = "select db_id,db_port,if(use_outer_inner=2,outer_net,inner_net) as hostip,db_user,db_passport,server_login_user,server_login_pwd,ssh_port,b.server_id from db_server_info a join server_info b on a.server_id=b.server_id where db_type=1"

    cursor = connection.cursor()
    cursor.execute(nsql)
    rows = cursor.fetchall()
    for item in rows:
        nDbid = item[0]
        nDbport = item[1]
        nHostip = item[2]
        nDbuser = item[3]
        nDbpassword = item[4]
        nServerloginuser = item[5]
        nServerloginpwd = item[6]
        nSshport = item[7]
        nServerid = item[8]

        shelldata = 'nmap -p %s  %s |grep open|wc -l' % (nDbport, nHostip)
        nMysqlstatus = commands.getoutput(shelldata)
        nMysqlstatus = int(nMysqlstatus.strip())

        nsqloldtime = "select max(create_time) from server_monitor_result "
        cursor = connection.cursor()
        cursor.execute(nsqloldtime)
        oldtimelist = cursor.fetchall()
        oldtime=oldtimelist[0][0]

        nsqlmonitor= "select monitor_id,monitor_target_name,monitor_shell from server_monitor_prototype where monitor_type=1"
        cursor.execute(nsqlmonitor)
        moniotors = cursor.fetchall()
        timedata = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        timedata = timedata
        for row in moniotors:
            nMonitorid = row[0]
            nMonitortargetname = row[1]
            nMonitorshell = row[2]

            if nMysqlstatus == 1:
                nNum = 0
                shelldata = 'mysql -u%s -p%s -h%s -P%s -N -e "%s"' % (nDbuser, nDbpassword, nHostip, nDbport, nMonitorshell)
                nValue = commands.getoutput(shelldata)

                Value = 'echo "%s"|grep -v "[Warning]"' % (nValue)
                nNum = commands.getoutput(Value)

                resultsql = "replace into server_monitor_result (monitor_id,server_id,db_id,monitor_values,create_time) value (%d,%d,%d,'%s','%s')" % (nMonitorid, nServerid, nDbid, nNum, timedata)
                cursor = connection.cursor()
                cursor.execute(resultsql)
                connection.commit()
                cursor.close()

                updatesql = "update server_monitor_result a,server_monitor_result b set a.real_values=round((a.monitor_values-b.monitor_values)/(unix_timestamp('%s')-unix_timestamp('%s')),4) where a.monitor_id=b.monitor_id and a.db_id=b.db_id and b.create_time='%s' and a.db_id=%s and a.monitor_id=%s and a.create_time='%s'" % (timedata, oldtime, oldtime, nDbid, nMonitorid, timedata)
                cursor = connection.cursor()
                cursor.execute(updatesql)
                connection.commit()
                cursor.close()


            nsqlstatupdate = "replace into mysql_status (`db_id`,`status`) values (%s,%s)"
            cursor = connection.cursor()
            cursor.execute(nsqlstatupdate, [nDbid, nMysqlstatus])
            cursor.close()
            connection.commit()
            connection.close()


def os_monitor_job():
    nsql = "select db_id,db_port,if(use_outer_inner=2,outer_net,inner_net) as hostip,db_user,db_passport,server_login_user,server_login_pwd,ssh_port,b.server_id from db_server_info a join server_info b on a.server_id=b.server_id where db_type=2"

    cursor = connection.cursor()
    cursor.execute(nsql)
    rows = cursor.fetchall()
    timedata = datetime.datetime.now().strftime("%Y-%m-%d %H:%M")
    timedata = timedata + ':00'
    for item in rows:
        nDbid = item[0]
        nDbport = item[1]
        nHostip = item[2]
        nDbuser = item[3]
        nDbpassword = item[4]
        nServerloginuser = item[5]
        nServerloginpwd = item[6]
        nSshport = item[7]
        nServerid = item[8]

        shelldata = 'nmap -p %s  %s |grep open|wc -l' % (nDbport, nHostip)
        nMysqlstatus = commands.getoutput(shelldata)
        nMysqlstatus = int(nMysqlstatus.strip())

        nsqlmonitor = "select monitory_id,monitor_target_name,monitor_shell from server_monitor_prototype where monitor_type=1"
        cursor.execute(nsqlmonitor)
        moniotors = cursor.fetchall()
        timedata = timedata + ':00'
        for row in moniotors:
            nMonitorid = row[0]
            nMonitortargetname = row[1]
            nMonitorshell = row[2]

            if nMysqlstatus == 1:
                nNum = 0
                shelldata = 'mysql -u%s -p%s -h%s -P%s -N -e "%s"' % (
                nDbuser, nDbpassword, nHostip, nDbport, nMonitorshell)
                nNum = commands.getoutput(shelldata)

                resultsql = "replace into server_monitor_result (monitor_id,server_id,db_id,monitor_values,create_time) value (%d,%d,%d,'%s','%s')" % (nMonitorid, nServerid, nDbid, nNum, timedata)
                cursor = connection.cursor()
                cursor.execute(resultsql)
                connection.commit()
                cursor.close()

                updatesql = "update server_monitor_result a,server_monitor_result b set a.real_values=round(a.monitor_values-b.monitor_values,4) where a.monitor_id=b.monitor_id and a.db_id=b.db_id and (unix_timestamp(a.create_time)-120)=unix_timestamp(b.create_time) and a.db_id=%s and a.monitor_id=%s and a.create_time='%s'" % (nDbid, nMonitorid, timedata)
                cursor = connection.cursor()
                cursor.execute(updatesql)
                connection.commit()
                cursor.close()

            nsqlupdate = "replace into mysql_status (`db_id`,`status`) values (%s,%s)"

            cursor = connection.cursor()
            cursor.execute(nsqlupdate, [nDbid, nMysqlstatus])
            cursor.close()
            connection.commit()
            connection.close()


def redis_monitor_job():
    nsql = "select db_id,db_port,if(use_outer_inner=2,outer_net,inner_net) as hostip,db_user,db_passport,server_login_user,server_login_pwd,ssh_port from db_server_info a join server_info b on a.server_id=b.server_id where db_type=2"

    cursor = connection.cursor()
    cursor.execute(nsql)
    rows = cursor.fetchall()
    timedata = datetime.datetime.now().strftime("%Y-%m-%d %H:%M")
    timedata = timedata + ':00'
    for item in rows:
        nDbid = item[0]
        nDbport = item[1]
        nHostip = item[2]
        nDbuser = item[3]
        nDbpassword = item[4]
        nServerloginuser = item[5]
        nServerloginpwd = item[6]
        nSshport = item[7]

        shelldata = 'nmap -p %s  %s |grep open|wc -l' % (nDbport, nHostip)
        nRedisstatus = commands.getoutput(shelldata)
        nRedisstatus = int(nRedisstatus.strip())

        if nRedisstatus == 1:
            r = redis.Redis(host=nHostip, port=nDbport, db=1)
            info = r.info()
            nRedisrole = info["role"]
            nRedisversion = str(info["redis_version"])
            nAofenabled = int(str(info["aof_enabled"]))
            nUptimeinseconds = str(info["uptime_in_seconds"])
            nConnectedclients = str(info["connected_clients"])
            nUsedmemory = str(info["used_memory"])
            nUsedmemoryrss = str(info["used_memory_rss"])
            nTotalconnectionsreceived = str(info["total_connections_received"])
            nTotalcommandsprocessed = str(info["total_commands_processed"])
            nInstantaneousopspersec = str(info["instantaneous_ops_per_sec"])
            nUsedcpu = str(info["used_cpu_sys"])
            nkeysnum = str(info["db0"]['keys'])

            nsqlupdate = "replace into redis_status (`db_id`,`status`,`redis_role`,`redis_version`,`aof_enabled`,`uptime_in_seconds`,`connected_clients`,`used_memory`,`used_memory_rss`,`total_connections_received`,`total_commands_processed`,`instantaneous_ops_per_sec`,`used_cpu`, `redis_keys`) values (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)"

            cursor = connection.cursor()
            cursor.execute(nsqlupdate, [nDbid, nRedisstatus, nRedisrole, nRedisversion, nAofenabled, nUptimeinseconds,nConnectedclients, nUsedmemory, nUsedmemoryrss, nTotalconnectionsreceived,nTotalcommandsprocessed, nInstantaneousopspersec, nUsedcpu, nkeysnum])
            cursor.close()

            nsqlupdate2 = "insert into redis_status_history (`db_id`,`status`,`redis_role`,`redis_version`,`aof_enabled`,`uptime_in_seconds`,`connected_clients`,`used_memory`,`used_memory_rss`,`total_connections_received`,`total_commands_processed`,`instantaneous_ops_per_sec`,`used_cpu`, `redis_keys`) values (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)"

            cursor1 = connection.cursor()
            cursor1.execute(nsqlupdate2, [nDbid, nRedisstatus, nRedisrole, nRedisversion, nAofenabled, nUptimeinseconds,nConnectedclients, nUsedmemory, nUsedmemoryrss, nTotalconnectionsreceived,nTotalcommandsprocessed, nInstantaneousopspersec, nUsedcpu, nkeysnum])
            cursor1.close()
            connection.commit()
            connection.close()

        else:
            nsqlupdate = "replace into redis_status (`db_id`,`status`) values (%s,0)"

            cursor = connection.cursor()
            cursor.execute(nsqlupdate, [nDbid])
            cursor.close()
            connection.commit()
            connection.close()