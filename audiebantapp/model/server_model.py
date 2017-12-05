#!/usr/bin/env python
# -*- coding: utf-8 -*-
# create by zhangsp 2017-70-26
# 用户全线增删改查

from django.db import connection


class Server(object):
    def __init__(self, username, npwd, nServername, nServersourceid, nServertype, nServergroupid, nServeruseid, nOuternet, nInnernet, nUseouterinner, nServerloginuser, nServerloginpwd, nSshport, nServerGroupName, nServerUserName, nServerId, nHostname, nCpunum, nMemorynum, nSystemname):
        self.username = username
        self.npwd = npwd
        self.nServername = nServername
        self.nServersourceid = nServersourceid
        self.nServertype = nServertype
        self.nServergroupid = nServergroupid
        self.nServeruseid = nServeruseid
        self.nOuternet = nOuternet
        self.nInnernet = nInnernet
        self.nUseouterinner = nUseouterinner
        self.nServerloginuser = nServerloginuser
        self.nServerloginpwd = nServerloginpwd
        self.nSshport = nSshport
        self.nServerGroupName = nServerGroupName
        self.nServerUserName = nServerUserName
        self.nServerId = nServerId
        self.nHostname = nHostname
        self.nCpunum = nCpunum
        self.nMemorynum = nMemorynum
        self.nSystemname = nSystemname


    @classmethod
    def serverlist(self):
        """
           获取服务器列表，主要获取可以自由设置内容   
        """
        nsql="select server_id,server_name,server_source_id,server_group_name,server_use_name,use_outer_inner,date_format(a.create_time,'%Y-%m-%d %H:%i:%s'),(select aa.service_value from server_info_ext aa left join server_service_prototype bb on aa.service_id=bb.service_id where aa.server_id=a.server_id and service_target_name='hostname' ),(select aa.service_value from server_info_ext aa left join server_service_prototype bb on aa.service_id=bb.service_id where aa.server_id=a.server_id and service_target_name='cpu_num' ),(select aa.service_value from server_info_ext aa left join server_service_prototype bb on aa.service_id=bb.service_id where aa.server_id=a.server_id and service_target_name='memory_num' ),(select aa.service_value from server_info_ext aa left join server_service_prototype bb on aa.service_value=bb.service_id where aa.server_id=a.server_id and service_target_name='system_name' ) from server_info a left join server_group_info b on a.server_group_id=b.server_group_id left join server_use_info c on a.server_use_id=c.server_use_id"
        cursor = connection.cursor()
        cursor.execute(nsql)
        rows = cursor.fetchall()
        cursor.close()
        jsonData = []
        for row in rows:
            result= {}
            result['serverid'] = row[0]
            result['servername'] = row[1]
            result['serversourceid'] = row[2]
            result['servergroupname'] = row[3]
            result['serverusename'] = row[4]
            result['useouterinner'] = row[5]
            result['createtime'] = row[6]
            if row[7] is None:
                result['serverhostname'] = ''
            else:
                result['serverhostname'] = row[7]
            if row[8] is None:
                result['cpunum'] = ''
            else:
                result['cpunum'] = row[8]
            if row[9] is None:
                result['memorynum'] = ''
            else:
                result['memorynum'] = row[9]
            if row[10] is None:
                result['serversystem'] = ''
            else:
                result['serversystem'] = row[10]

            jsonData.append(result)
        return jsonData


    @classmethod
    def serveradd(self, nServername, nServersourceid, nServertype, nServergroupid, nServeruseid, nOuternet, nInnernet, nUseouterinner, nServerloginuser, nServerloginpwd, nSshport):
        """
            添加服务器信息   
        """
        nsql = "insert into server_info (`server_name`,`server_source_id`,`server_type`,`server_group_id`,`server_use_id`,`outer_net`,`inner_net`,`use_outer_inner`,`server_login_user`,`server_login_pwd`,`ssh_port`) values (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"
        cursor = connection.cursor()
        cursor.execute(nsql, [nServername, nServersourceid, nServertype, nServergroupid, nServeruseid, nOuternet, nInnernet, nUseouterinner, nServerloginuser, nServerloginpwd, nSshport])
        cursor.close()
        connection.commit()
        connection.close()


    @classmethod
    def servergrouplist(self):
        """
             获取服务器项目分组列表   
        """
        nsql = "select server_group_id,server_group_name,date_format(create_time,'%Y-%m-%d %H:%i:%s'),date_format(update_time,'%Y-%m-%d %H:%i:%s') from server_group_info "
        cursor = connection.cursor()
        cursor.execute(nsql)
        rows = cursor.fetchall()
        cursor.close()
        jsonData = []
        for row in rows:
            result = {}
            result['servergroupid'] = row[0]
            result['servergroupname'] = row[1]
            result['create_time'] = row[2]
            result['update_time'] = row[3]
            jsonData.append(result)
        return jsonData


    @classmethod
    def serveruselist(self):
        """
            获取服务器用途分类列表 
        """
        nsql = "select server_use_id,server_use_name,date_format(create_time,'%Y-%m-%d %H:%i:%s'),date_format(update_time,'%Y-%m-%d %H:%i:%s') from server_use_info "
        cursor = connection.cursor()
        cursor.execute(nsql)
        rows = cursor.fetchall()
        cursor.close()
        jsonData = []
        for row in rows:
            result = {}
            result['serveruseid'] = row[0]
            result['serverusename'] = row[1]
            result['create_time'] = row[2]
            result['update_time'] = row[3]
            jsonData.append(result)
        return jsonData


    @classmethod
    def serversourceid(self, nServerid):
        """
           获取该服务器的sourceid 
        """
        nsql = "select server_source_id from server_info where server_id=%s"
        cursor = connection.cursor()
        cursor.execute(nsql, nServerid)
        rows = cursor.fetchone()
        nServerSourceId = rows[0]
        return nServerSourceId


    @classmethod
    def servernet(self, nType):
        """
           获取该服务器的网络Ip,nType=1,获取外网IP, nType=2,获取内网IP
        """
        if nType == 1:
            nsql = "select outer_net from server_info where server_id=%s"
            cursor = connection.cursor()
            cursor.execute(nsql)
            rows = cursor.fetchone()
            nServerSourceId = rows[0]
            return nServerSourceId
        else:
            nsql = "select inner_net from server_info where server_id=%s"
            cursor = connection.cursor()
            cursor.execute(nsql)
            rows = cursor.fetchone()
            nServerSourceId = rows[0]
            return nServerSourceId


    @classmethod
    def servergroupadd(self, nServerGroupName):
        nsql = "insert into server_group_info (`server_group_name`) values (%s)"
        cursor = connection.cursor()
        cursor.execute(nsql, [nServerGroupName])
        cursor.close()
        connection.commit()
        connection.close()


    @classmethod
    def serveruseadd(self, nServerUserName):
        nsql = "insert into server_use_info (`server_use_name`) values (%s)"
        cursor = connection.cursor()
        cursor.execute(nsql, [nServerUserName])
        cursor.close()
        connection.commit()
        connection.close()

    @classmethod
    def serverbeforeupdate(self, nServerId):
        nsql = "select `server_name`,`server_source_id`,`server_type`,`server_group_id`,`server_use_id`,`outer_net`,`inner_net`,`use_outer_inner`," \
               "`server_login_user`,`server_login_pwd`,`ssh_port` ," \
               "(select aa.service_value from server_info_ext aa left join server_service_prototype bb on aa.service_id=bb.service_id where aa.server_id=a.server_id and service_target_name='hostname' )," \
               "(select aa.service_value from server_info_ext aa left join server_service_prototype bb on aa.service_id=bb.service_id where aa.server_id=a.server_id and service_target_name='cpu_num' )," \
               "(select aa.service_value from server_info_ext aa left join server_service_prototype bb on aa.service_id=bb.service_id where aa.server_id=a.server_id and service_target_name='memory_num' )," \
               "(select aa.service_value from server_info_ext aa left join server_service_prototype bb on aa.service_value=bb.service_id where aa.server_id=a.server_id and service_target_name='system_name' ) " \
               "from server_info a where server_id=%s"
        cursor = connection.cursor()
        cursor.execute(nsql, [nServerId])
        rows = cursor.fetchone()
        cursor.close()
        jsonData = []
        result = {}
        result['serverid'] = nServerId
        result['servername'] = rows[0]
        result['serversourceid'] = rows[1]
        result['servertype'] = rows[2]
        result['servergroupid'] = rows[3]
        result['serveruseid'] = rows[4]
        result['outernet'] = rows[5]
        result['innernet'] = rows[6]
        result['useouterinner'] = rows[7]
        result['serverloginuser'] = rows[8]
        result['serverloginpwd'] = rows[9]
        result['sshport'] = rows[10]
        if rows[11] is None:
            result['hostname'] = ''
        else:
            result['hostname'] = rows[11]
        if rows[12] is None:
            result['cpunum'] = ''
        else:
            result['cpunum'] = rows[12]
        if rows[13] is None:
            result['memorynum'] = ''
        else:
            result['memorynum'] = rows[13]
        if rows[14] is None:
            result['serversystem'] = ''
        else:
            result['serversystem'] = rows[14]
        jsonData.append(result)

        print jsonData
        return jsonData

    @classmethod
    def serverupdate(self, nServerid, nServername, nServersourceid, nServergroupid, nServertype, nServeruseid, nOuternet, nInnernet, nUseouterinner, nServerloginuser, nServerloginpwd, nSshport):
        if not nOuternet.strip():
            nOuternet = ''
        if not nInnernet.strip():
            nInnernet = ''
        if not nUseouterinner.strip():
            nUseouterinner = ''

        print "nServeruseid = " + nServeruseid

        nsql = "update  server_info set server_name=%s, server_type=%s, server_source_id=%s, server_group_id=%s, server_use_id=%s, outer_net=%s, inner_net=%s, use_outer_inner=%s, server_login_user=%s, server_login_pwd=%s, ssh_port=%s  where server_id=%s"
        print nsql
        cursor = connection.cursor()
        cursor.execute(nsql, [nServername, nServertype, nServersourceid, nServergroupid, nServeruseid, nOuternet,nInnernet, nUseouterinner, nServerloginuser, nServerloginpwd, nSshport, nServerid])
        cursor.close()
        connection.commit()
        connection.close()

    @classmethod
    def serverdelete(self, nServerid):
        nsql = "delete from server_info where menuid=%s "
        cursor = connection.cursor()
        cursor.execute(nsql, [nServerid])
        connection.commit()
        connection.close()

        nsqltwo = "delete from server_info_ext where server_id=%s "
        cursor = connection.cursor()
        cursor.execute(nsqltwo, [nServerid])
        connection.commit()
        connection.close()