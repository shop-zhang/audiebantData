#! /usr/bin/env python
# -*- coding: utf-8 -*-
# create by zhangsp 2017-07-26

from django.http import HttpResponseRedirect
from django.shortcuts import render_to_response
from audiebantapp.model.mysqladvisor_model import MysqlAdvisor
from audiebantapp.model.mysqlincedata_model import MysqlIncedata
from audiebantapp.model.right_model import Right


def sqlauditinglist(req):
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
            datalist = MysqlAdvisor.mysqladvisorlist(nUserRole, nRightUserid)
            rowdata = MysqlIncedata.gettastnum(nUserRole, nRightUserid)
            return render_to_response('mysqlsqladvisor/mysql-sqlauditinglist.html', {'data': datalist, 'nums': rowdata})

def sqlauditingadd(req):
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
            if req.method == 'GET':
                nRightUserid = req.session["sess_userid"]
                nUserRole = req.session["sess_userrole"]
                datalist = MysqlIncedata.mysqllist(nUserRole, nRightUserid)
                return render_to_response('mysqlsqladvisor/mysql-sqlauditingadd.html', {'data': datalist})
            else:
                nUserid = req.session["sess_userid"]
                nDbid = req.POST.get('dbid')
                nSqlcontent= req.POST.get('sqlcontent')
                MysqlAdvisor.sqladvisor(nDbid, nSqlcontent, nUserid)

                return HttpResponseRedirect('/mysqlindex/sqlauditinglist/')

def sqladvisorinfo(req):
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
            nAid = req.GET['id']
            datalist = MysqlAdvisor.mysqladvisorinfo(nAid)
            return render_to_response('mysqlsqladvisor/mysql-sqladvisorinfo.html', {'data': datalist})