#!/usr/bin/python
import commands
import datetime
import MySQLdb
import redis

def mysql_monitor_job():
    nsql = "select db_id,db_port,if(use_outer_inner=2,outer_net,inner_net) as hostip,db_user,db_passport,server_login_user,server_login_pwd,ssh_port from db_server_info a join server_info b on a.server_id=b.server_id where db_type=2"

    conn = MySQLdb.connect(host='127.0.0.1', user='root', passwd='12345678', db='ywauto', port=3306, charset="utf8")
    cursor = conn.cursor()
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

            cursor = conn.cursor()
            cursor.execute(nsqlupdate, [nDbid, nRedisstatus, nRedisrole, nRedisversion, nAofenabled, nUptimeinseconds,
                                        nConnectedclients, nUsedmemory, nUsedmemoryrss, nTotalconnectionsreceived,
                                        nTotalcommandsprocessed, nInstantaneousopspersec, nUsedcpu, nkeysnum])
            cursor.close()

            nsqlupdate2 = "insert into redis_status_history (`db_id`,`status`,`redis_role`,`redis_version`,`aof_enabled`,`uptime_in_seconds`,`connected_clients`,`used_memory`,`used_memory_rss`,`total_connections_received`,`total_commands_processed`,`instantaneous_ops_per_sec`,`used_cpu`, `redis_keys`) values (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)"

            cursor1 = conn.cursor()
            cursor1.execute(nsqlupdate2, [nDbid, nRedisstatus, nRedisrole, nRedisversion, nAofenabled, nUptimeinseconds,
                                          nConnectedclients, nUsedmemory, nUsedmemoryrss, nTotalconnectionsreceived,
                                          nTotalcommandsprocessed, nInstantaneousopspersec, nUsedcpu, nkeysnum])
            cursor1.close()
            conn.commit()
            conn.close()


        else:
            nsqlupdate = "replace into redis_status (`db_id`,`status`) values (%s,0)"

            cursor = conn.cursor()
            cursor.execute(nsqlupdate, [nDbid])
            cursor.close()
            conn.commit()
            conn.close()

def os_monitor_job():
    nsql = "select db_id,db_port,if(use_outer_inner=2,outer_net,inner_net) as hostip,db_user,db_passport,server_login_user,server_login_pwd,ssh_port from db_server_info a join server_info b on a.server_id=b.server_id where db_type=2"

    conn = MySQLdb.connect(host='127.0.0.1', user='root', passwd='12345678', db='ywauto', port=3306, charset="utf8")
    cursor = conn.cursor()
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

            cursor = conn.cursor()
            cursor.execute(nsqlupdate, [nDbid, nRedisstatus, nRedisrole, nRedisversion, nAofenabled, nUptimeinseconds,
                                        nConnectedclients, nUsedmemory, nUsedmemoryrss, nTotalconnectionsreceived,
                                        nTotalcommandsprocessed, nInstantaneousopspersec, nUsedcpu, nkeysnum])
            cursor.close()

            nsqlupdate2 = "insert into redis_status_history (`db_id`,`status`,`redis_role`,`redis_version`,`aof_enabled`,`uptime_in_seconds`,`connected_clients`,`used_memory`,`used_memory_rss`,`total_connections_received`,`total_commands_processed`,`instantaneous_ops_per_sec`,`used_cpu`, `redis_keys`) values (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)"

            cursor1 = conn.cursor()
            cursor1.execute(nsqlupdate2, [nDbid, nRedisstatus, nRedisrole, nRedisversion, nAofenabled, nUptimeinseconds,
                                          nConnectedclients, nUsedmemory, nUsedmemoryrss, nTotalconnectionsreceived,
                                          nTotalcommandsprocessed, nInstantaneousopspersec, nUsedcpu, nkeysnum])
            cursor1.close()
            conn.commit()
            conn.close()


        else:
            nsqlupdate = "replace into redis_status (`db_id`,`status`) values (%s,0)"

            cursor = conn.cursor()
            cursor.execute(nsqlupdate, [nDbid])
            cursor.close()
            conn.commit()
            conn.close()


def redis_monitor_job():
    nsql = "select db_id,db_port,if(use_outer_inner=2,outer_net,inner_net) as hostip,db_user,db_passport,server_login_user,server_login_pwd,ssh_port from db_server_info a join server_info b on a.server_id=b.server_id where db_type=2"

    conn = MySQLdb.connect(host='127.0.0.1', user='root', passwd='12345678', db='ywauto', port=3306, charset="utf8")
    cursor = conn.cursor()
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

            cursor = conn.cursor()
            cursor.execute(nsqlupdate, [nDbid, nRedisstatus, nRedisrole, nRedisversion, nAofenabled, nUptimeinseconds,
                                        nConnectedclients, nUsedmemory, nUsedmemoryrss, nTotalconnectionsreceived,
                                        nTotalcommandsprocessed, nInstantaneousopspersec, nUsedcpu, nkeysnum])
            cursor.close()

            nsqlupdate2 = "insert into redis_status_history (`db_id`,`status`,`redis_role`,`redis_version`,`aof_enabled`,`uptime_in_seconds`,`connected_clients`,`used_memory`,`used_memory_rss`,`total_connections_received`,`total_commands_processed`,`instantaneous_ops_per_sec`,`used_cpu`, `redis_keys`) values (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)"

            cursor1 = conn.cursor()
            cursor1.execute(nsqlupdate2, [nDbid, nRedisstatus, nRedisrole, nRedisversion, nAofenabled, nUptimeinseconds,
                                          nConnectedclients, nUsedmemory, nUsedmemoryrss, nTotalconnectionsreceived,
                                          nTotalcommandsprocessed, nInstantaneousopspersec, nUsedcpu, nkeysnum])
            cursor1.close()
            conn.commit()
            conn.close()


        else:
            nsqlupdate = "replace into redis_status (`db_id`,`status`) values (%s,0)"

            cursor = conn.cursor()
            cursor.execute(nsqlupdate, [nDbid])
            cursor.close()
            conn.commit()
            conn.close()