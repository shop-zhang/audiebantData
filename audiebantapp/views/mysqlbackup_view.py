#! /usr/bin/env python
# -*- coding: utf-8 -*-
# create by zhangsp 2017-07-26

from django.http import HttpResponseRedirect
from django.shortcuts import render_to_response
from audiebantapp.model.mysqlbackup_model import MysqlBackup
from audiebantapp.model.right_model import Right

def mysqlbackuplist(req):
    if not req.session.get("sess_userid", False):
        return HttpResponseRedirect("/login/")
    else:
        nUrldata = req.path
        nRightUserid = req.session["sess_userid"]
        nUserRole = req.session["sess_userrole"]
        nHaveRight = Right.userrightcheck(nRightUserid, nUrldata)
        if nHaveRight[0]["num"] == 0:
            return HttpResponseRedirect("/noright/")
        else:
            datalist = MysqlBackup.mysqlbackuplist(nUserRole, nRightUserid)
            return render_to_response('mysqlbackup/mysql-backuplist.html', {'data': datalist})