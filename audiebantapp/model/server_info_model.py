#!/usr/bin/env python
# -*- coding: utf-8 -*-
# create by zhangsp 2017-70-26
# 用户全线增删改查

import paramiko
from django.db import connection
from audiebantapp.model.server_model import Server



class ServerInfo(object):
    def __init__(self, nServerid ):
        self.nServerid = nServerid


    @classmethod
    def servergetinfo(self, nServerid):
        """
           获取服务器信息，代码程序部署在不同的服务器上获取服务器信息的方式是不一样的  
        """
        nsql="select user_postion from product_stat_postion"
        cursor = connection.cursor()
        cursor.execute(nsql)
        rows = cursor.fetchone()
        nUserPostion=rows[0]


        nServerSourceId = Server.serversourceid(nServerid)
        nSqlinfo = "select server_id, outer_net, inner_net,use_outer_inner ,server_login_user, server_login_pwd, ssh_port  from server_info where server_id=%s"
        cursorinfo = connection.cursor()
        cursorinfo.execute(nSqlinfo, nServerid)
        inforows = cursorinfo.fetchone()
        nServeridone = inforows[0]
        nOuternet = inforows[1]
        nInnernet = inforows[2]
        nUseouterinner = inforows[3]
        nServerloginuser = inforows[4]
        nServerloginpwd = inforows[5]
        nSshport = inforows[6]

        if nServerSourceId == nUserPostion:
            """
               获取Linux的基础数据， 
            """
            nSqldata = "select service_id, service_target_name, service_target_value, service_shell  from server_service_prototype where service_type=5"
            cursordata = connection.cursor()
            cursordata.execute(nSqldata)
            datarows = cursordata.fetchall()

            print datarows

            for row in datarows:
                nServiceid = row[0]

                nShelldata = row[3]
                ssh = paramiko.SSHClient()
                ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
                ssh.connect(nInnernet, nSshport, nServerloginuser, nServerloginpwd)
                stdin, stdout, stderr = ssh.exec_command(nShelldata)
                outmsg, outerr = stdout.read(), stderr.read()
                nServiceNum = outmsg
                print nServiceNum
                ssh.close()
                #print serviceNum

                nSqlupdate = "replace into server_info_ext (`server_id`,`service_id`,`service_value`) values (%s,%s,%s)"
                cursordata = connection.cursor()
                cursordata.execute(nSqlupdate, [nServerid, nServiceid, nServiceNum])
                cursor.close()
                connection.commit()
                connection.close()
        else:
            print 111111

