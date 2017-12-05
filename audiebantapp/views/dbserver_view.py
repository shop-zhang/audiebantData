#! /usr/bin/env python
# -*- coding: utf-8 -*-
# create by zhangsp 2017-07-26

from django.http import HttpResponseRedirect
from django.shortcuts import render_to_response
from audiebantapp.model.dbserver_model import Dbserver
from audiebantapp.model.right_model import Right
import datetime, time

def dbserverlist(req):
    if not req.session.get("sess_userid", False):
        return HttpResponseRedirect("/login/")
    else:
        nUrldata = req.path
        nRightUserid = req.session["sess_userid"]
        nHaveRight = Right.userrightcheck(nRightUserid, nUrldata)
        if nHaveRight[0]["num"] == 0:
            return HttpResponseRedirect("/noright/")
        else:
            datalist = Dbserver.dbserverlist()
            return render_to_response('dbserver/dbserver-list.html', {'data': datalist})


def dbserveradd(req):
    if not req.session.get("sess_userid", False):
        return HttpResponseRedirect("/login/")
    else:
        nUrldata = req.path
        nRightUserid = req.session["sess_userid"]
        nHaveRight = Dbserver.userrightcheck(nRightUserid, nUrldata)
        if nHaveRight[0]["num"] == 0:
            return HttpResponseRedirect("/noright/")
        else:
            if req.method == 'GET':
                    datalist = Dbserver.dbserverbeforeadd()
                    return render_to_response('dbserver/dbserver-add.html', {'data': datalist})
            else:
                nUserid = req.session["sess_userid"]
                nDbname = req.POST.get('dbname')
                nServerid = req.POST.get('serverid')
                nDbtype = req.POST.get('dbtype')
                nDbservertype = req.POST.get('dbservertype')
                nDbport = req.POST.get('dbport')
                nDbuser = req.POST.get('dbuser')
                nDbpassword = req.POST.get('dbpassword')

                Dbserver.dbserveradd(nDbname, nServerid, nDbtype, nDbservertype, nDbport, nDbuser, nDbpassword)
                return HttpResponseRedirect('/dbserver/dbserverlist/')


def dbserverupdate(req):
    if not req.session.get("sess_userid", False):
        return HttpResponseRedirect("/login/")
    else:

        if req.method == 'GET':
            nDbid = req.GET['dbid']
            dbserverinfo = Dbserver.dbserverbeforeupdate(nDbid)
            datalist = Dbserver.dbserverbeforeadd()
            return render_to_response('dbserver/dbserver-update.html', {'data': datalist, 'datas': dbserverinfo})
        else:
            nUserid = req.session["sess_userid"]
            nDbid = req.GET['dbid']
            nDbname = req.POST.get('dbname')
            nMenuid = req.POST.get('menuid')
            nAction = req.POST.get('action')
            nStatus = int(req.POST.get('status'))

            Dbserver.rightupdate(nDbname, nAction, nStatus, nMenuid)
            return HttpResponseRedirect('/dbserver/dbserverlist/')


def dbserverdelete(req):
    if not req.session.get("sess_userid", False):
        return HttpResponseRedirect("/login/")
    else:
        nUrldata = req.path
        nRightUserid = req.session["sess_userid"]
        nHaveRight = Dbserver.userrightcheck(nRightUserid, nUrldata)
        if nHaveRight[0]["num"] == 0:
            return HttpResponseRedirect("/noright/")
        else:
            nRightid = req.GET['rightsid']
            Dbserver.rightdelete(nRightid)
            return HttpResponseRedirect('/right/rightlist/')