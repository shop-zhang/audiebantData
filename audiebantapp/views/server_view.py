#! /usr/bin/env python
# -*- coding: utf-8 -*-
# create by zhangsp 2017-07-26

from django.http import HttpResponseRedirect
from django.shortcuts import render_to_response
from audiebantapp.model.server_model import Server
from audiebantapp.model.right_model import Right
from audiebantapp.model.server_info_model import ServerInfo


def serverlist(req):
    if not req.session.get("sess_userid", False):
        return HttpResponseRedirect("/login/")
    else:
        nUrldata = req.path
        nRightUserid = req.session["sess_userid"]
        nHaveRight = Right.userrightcheck(nRightUserid, nUrldata)
        if nHaveRight[0]["num"] == 0:
            return HttpResponseRedirect("/noright/")
        else:
            datalist = Server.serverlist()
            return render_to_response('server/server-list.html', {'data': datalist})


def serveradd(req):
    if not req.session.get("sess_userid", False):
        return HttpResponseRedirect("/login/")
    else:
        nUrldata = req.path
        nRightUserid = req.session["sess_userid"]
        nHaveRight = Right.userrightcheck(nRightUserid, nUrldata)
        print nHaveRight
        if nHaveRight[0]["num"] == 0:
            return HttpResponseRedirect("/noright/")
        else:
            if req.method == 'GET':
                    datalist = Server.serveruselist()
                    datainfo = Server.servergrouplist()
                    return render_to_response('server/server-add.html', {'data': datalist,'info': datainfo})
            else:
                nServername = req.POST.get('servername')
                nServersourceid = int(req.POST.get('serversourceid'))
                nServertype = int(req.POST.get('servertype'))
                nServergroupid = int(req.POST.get('servergroupid'))
                nServeruseid = int(req.POST.get('serveruseid'))
                nOuternet = req.POST.get('outernet')
                nInnernet = req.POST.get('innernet')
                nUseouterinner = req.POST.get('useouterinner')
                nServerloginuser = req.POST.get('serverloginuser')
                nServerloginpwd = req.POST.get('serverloginpwd')
                nSshport = req.POST.get('sshport')

                Server.serveradd(nServername, nServersourceid, nServertype, nServergroupid, nServeruseid, nOuternet, nInnernet, nUseouterinner, nServerloginuser, nServerloginpwd, nSshport)
                return HttpResponseRedirect('/server/serverlist/')


def serverupdate(req):
    if not req.session.get("sess_userid", False):
        return HttpResponseRedirect("/login/")
    else:
        nUrldata = req.path
        nRightUserid = req.session["sess_userid"]
        nHaveRight = Right.userrightcheck(nRightUserid, nUrldata)
        if nHaveRight[0]["num"] == 0:
            return HttpResponseRedirect("/noright/")
        else:
            if req.method == 'GET':
                nServerid = req.GET['serverid']
                serverinfo = Server.serverbeforeupdate(nServerid)
                datalist = Server.serveruselist()
                datainfo = Server.servergrouplist()
                print datalist
                return render_to_response('server/server-update.html', {'datas': serverinfo, 'info': datainfo, 'data': datalist})
            else:
                nServerid = req.GET['serverid']
                nServername = req.POST.get('servername')
                nServersourceid = req.POST.get('serversourceid')
                nServergroupid = req.POST.get('servergroupid')
                nServertype = req.POST.get('servertype')
                nServeruseid = req.POST.get('serveruseid')
                nOuternet = req.POST.get('outernet')
                nInnernet = req.POST.get('innernet')
                nUseouterinner = req.POST.get('useouterinner')
                nServerloginuser = req.POST.get('serverloginuser')
                nServerloginpwd = req.POST.get('serverloginpwd')
                nSshport= req.POST.get('sshport')
                nHostname = req.POST.get('hostname')
                nCpunum = req.POST.get('cpunum')
                nMemorynum = req.POST.get('memorynum')
                nSystemname = req.POST.get('systemname')

                Server.serverupdate(nServerid, nServername, nServersourceid, nServergroupid, nServertype, nServeruseid, nOuternet, nInnernet, nUseouterinner, nServerloginuser, nServerloginpwd, nSshport)
                return HttpResponseRedirect('/server/serverlist/')


def serverdelete(req):
    if not req.session.get("sess_userid", False):
        return HttpResponseRedirect("/login/")
    else:
        nUrldata = req.path
        nRightUserid = req.session["sess_userid"]
        nHaveRight = Right.userrightcheck(nRightUserid, nUrldata)
        if nHaveRight[0]["num"] == 0:
            return HttpResponseRedirect("/noright/")
        else:
            nRightid = req.GET['rightsid']
            Right.rightdelete(nRightid)
            return HttpResponseRedirect('/server/serverlist/')


def servergetinfo(req):
    if not req.session.get("sess_userid", False):
        return HttpResponseRedirect("/login/")
    else:
        nUrldata = req.path
        nRightUserid = req.session["sess_userid"]
        nHaveRight = Right.userrightcheck(nRightUserid, nUrldata)
        if nHaveRight[0]["num"] == 0:
            return HttpResponseRedirect("/noright/")
        else:
            nServerid = req.GET['serverid']
            ServerInfo.servergetinfo(nServerid)
            return HttpResponseRedirect('/server/serverlist/')


def servergrouplist(req):
    if not req.session.get("sess_userid", False):
        return HttpResponseRedirect("/login/")
    else:
        nUrldata = req.path
        nRightUserid = req.session["sess_userid"]
        nHaveRight = Right.userrightcheck(nRightUserid, nUrldata)
        if nHaveRight[0]["num"] == 0:
            return HttpResponseRedirect("/noright/")
        else:
            datalist = Server.servergrouplist()
            return render_to_response('server/server-group-list.html', {'data': datalist})


def serveruselist(req):
    if not req.session.get("sess_userid", False):
        return HttpResponseRedirect("/login/")
    else:
        nUrldata = req.path
        nRightUserid = req.session["sess_userid"]
        nHaveRight = Right.userrightcheck(nRightUserid, nUrldata)
        if nHaveRight[0]["num"] == 0:
            return HttpResponseRedirect("/noright/")
        else:
            datalist = Server.serveruselist()
            return render_to_response('server/server-use-list.html', {'data': datalist})


def serveruseadd(req):
    if not req.session.get("sess_userid", False):
        return HttpResponseRedirect("/login/")
    else:
        nUrldata = req.path
        nRightUserid = req.session["sess_userid"]
        nHaveRight = Right.userrightcheck(nRightUserid, nUrldata)
        print nHaveRight
        if nHaveRight[0]["num"] == 0:
            return HttpResponseRedirect("/noright/")
        else:
            if req.method == 'GET':
                return render_to_response('server/server-use-add.html')
            else:
                nServerUserName = req.POST.get('serverusename')

                Server.serveruseadd(nServerUserName)
                return HttpResponseRedirect('/server/serveruselist/')


def serveruseupdate(req):
    if not req.session.get("sess_userid", False):
        return HttpResponseRedirect("/login/")
    else:
        nUrldata = req.path
        nRightUserid = req.session["sess_userid"]
        nHaveRight = Right.userrightcheck(nRightUserid, nUrldata)
        print nHaveRight
        if nHaveRight[0]["num"] == 0:
            return HttpResponseRedirect("/noright/")
        else:
            if req.method == 'GET':
                return render_to_response('server/server-use-update.html')
            else:
                nServerUserName = req.POST.get('serverusename')

                Server.serveruseadd(nServerUserName)
                return HttpResponseRedirect('/server/serveruselist/')


def servergroupdelete(req):
    if not req.session.get("sess_userid", False):
        return HttpResponseRedirect("/login/")
    else:
        nUrldata = req.path
        nRightUserid = req.session["sess_userid"]
        nHaveRight = Right.userrightcheck(nRightUserid, nUrldata)
        print nHaveRight
        if nHaveRight[0]["num"] == 0:
            return HttpResponseRedirect("/noright/")
        else:
            if req.method == 'GET':
                    return render_to_response('server/server-group-add.html')
            else:
                nServerGroupName = req.POST.get('servergroupname')

                Server.servergroupadd(nServerGroupName)
                return HttpResponseRedirect('/server/servergrouplist/')


def servergroupadd(req):
    if not req.session.get("sess_userid", False):
        return HttpResponseRedirect("/login/")
    else:
        nUrldata = req.path
        nRightUserid = req.session["sess_userid"]
        nHaveRight = Right.userrightcheck(nRightUserid, nUrldata)
        print nHaveRight
        if nHaveRight[0]["num"] == 0:
            return HttpResponseRedirect("/noright/")
        else:
            if req.method == 'GET':
                    return render_to_response('server/server-group-add.html')
            else:
                nServerGroupName = req.POST.get('servergroupname')

                Server.servergroupadd(nServerGroupName)
                return HttpResponseRedirect('/server/servergrouplist/')

def servergroupupdate(req):
    if not req.session.get("sess_userid", False):
        return HttpResponseRedirect("/login/")
    else:
        nUrldata = req.path
        nRightUserid = req.session["sess_userid"]
        nHaveRight = Right.userrightcheck(nRightUserid, nUrldata)
        print nHaveRight
        if nHaveRight[0]["num"] == 0:
            return HttpResponseRedirect("/noright/")
        else:
            if req.method == 'GET':
                    return render_to_response('server/server-group-add.html')
            else:
                nServerGroupName = req.POST.get('servergroupname')

                Server.servergroupadd(nServerGroupName)
                return HttpResponseRedirect('/server/servergrouplist/')