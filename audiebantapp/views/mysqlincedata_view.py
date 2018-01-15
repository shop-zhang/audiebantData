#! /usr/bin/env python
# -*- coding: utf-8 -*-
# create by zhangsp 2017-07-26

from django.http import HttpResponseRedirect
from django.shortcuts import render_to_response
from audiebantapp.model.mysqlincedata_model import MysqlIncedata
from audiebantapp.model.right_model import Right

def mysqllist(req):
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
            datalist = MysqlIncedata.mysqllist(nUserRole, nRightUserid)
            rowdata = MysqlIncedata.gettastnum(nUserRole, nRightUserid)
            return render_to_response('mysqlincedata/mysql-list.html', {'data': datalist, 'nums': rowdata})

def mysqlsqltask(req):
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
                return render_to_response('mysqlincedata/mysql-sqltask.html', {'data': datalist})
            else:
                nUserid = req.session["sess_userid"]
                nDbid = req.POST.get('dbid')
                nSqlcontent= req.POST.get('sqlcontent')
                MysqlIncedata.addmysqlsqltask(nDbid, nSqlcontent, nUserid)

                return HttpResponseRedirect('/mysql/tobeexecutemysqltask/')

def mysqlfinishtask(req):
    if not req.session.get("sess_userid", False):
        return HttpResponseRedirect("/login/")
    else:
        nUrldata = req.path
        nRightUserid = req.session["sess_userid"]
        nHaveRight = Right.userrightcheck(nRightUserid, nUrldata)
        if nHaveRight[0]["num"] == 0:
            return HttpResponseRedirect("/noright/")
        else:
            nRightUserid = req.session["sess_userid"]
            nUserRole = req.session["sess_userrole"]
            datalist = MysqlIncedata.mysqlfinishtask(nUserRole, nRightUserid)
            return render_to_response('mysqlincedata/mysql-finishtask.html', {'data': datalist})

def tobeexecutemysqltask(req):
    if not req.session.get("sess_userid", False):
        return HttpResponseRedirect("/login/")
    else:
        nUrldata = req.path
        nRightUserid = req.session["sess_userid"]
        nHaveRight = Right.userrightcheck(nRightUserid, nUrldata)
        if nHaveRight[0]["num"] == 0:
            return HttpResponseRedirect("/noright/")
        else:
            nRightUserid = req.session["sess_userid"]
            nUserRole = req.session["sess_userrole"]
            datalist = MysqlIncedata.tobeexecutemysqltask(nUserRole, nRightUserid)
            return render_to_response('mysqlincedata/mysql-tobeexecute.html', {'data': datalist})

def sqlcontentinfo(req):
    if not req.session.get("sess_userid", False):
        return HttpResponseRedirect("/login/")
    else:
        nUrldata = req.path
        nRightUserid = req.session["sess_userid"]
        nHaveRight = Right.userrightcheck(nRightUserid, nUrldata)
        if nHaveRight[0]["num"] == 0:
            return HttpResponseRedirect("/noright/")
        else:
            nTaskid = req.GET['taskid']
            datalist = MysqlIncedata.sqlcontentinfo(nTaskid)
            return render_to_response('mysqlincedata/mysql-sqlcontentinfo.html', {'data': datalist})

def sqlcheckresult(req):
    if not req.session.get("sess_userid", False):
        return HttpResponseRedirect("/login/")
    else:
        nUrldata = req.path
        nRightUserid = req.session["sess_userid"]
        nHaveRight = Right.userrightcheck(nRightUserid, nUrldata)
        if nHaveRight[0]["num"] == 0:
            return HttpResponseRedirect("/noright/")
        else:
            nTaskid = req.GET['taskid']
            datalist = MysqlIncedata.sqlcheckresult(nTaskid)
            return render_to_response('mysqlincedata/mysql-sqlcheckresult.html', {'data': datalist})

def sqlexecresult(req):
    if not req.session.get("sess_userid", False):
        return HttpResponseRedirect("/login/")
    else:
        nUrldata = req.path
        nRightUserid = req.session["sess_userid"]
        nHaveRight = Right.userrightcheck(nRightUserid, nUrldata)
        if nHaveRight[0]["num"] == 0:
            return HttpResponseRedirect("/noright/")
        else:
            nTaskid = req.GET['taskid']
            datalist = MysqlIncedata.sqlexecresult(nTaskid)
            return render_to_response('mysqlincedata/mysql-sqlexecresult.html', {'data': datalist})

def sqlcontentupdate(req):
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
                nTaskid = req.GET['taskid']
                datalist = MysqlIncedata.sqlcontentinfo(nTaskid)
                nRightUserid = req.session["sess_userid"]
                nUserRole = req.session["sess_userrole"]
                mysqllist = MysqlIncedata.mysqllist(nUserRole, nRightUserid)
                return render_to_response('mysqlincedata/mysql-sqlcontentupdate.html', {'data': datalist ,'mysqldata': mysqllist})
            else:
                nTaskid = req.POST.get('taskid')
                nDbid = req.POST.get('dbid')
                nSqlcontent = req.POST.get('sqlcontent')
                MysqlIncedata.sqlcontentupdate(nTaskid, nDbid, nSqlcontent)


                return HttpResponseRedirect('/mysql/tobeexecutemysqltask/')

def sqlexecbyinception(req):
    if not req.session.get("sess_userid", False):
        return HttpResponseRedirect("/login/")
    else:
        nUrldata = req.path
        nRightUserid = req.session["sess_userid"]
        nHaveRight = Right.userrightcheck(nRightUserid, nUrldata)
        if nHaveRight[0]["num"] == 0:
            return HttpResponseRedirect("/noright/")
        else:
            nTaskid = req.GET['taskid']
            nRightUserid = req.session["sess_userid"]
            MysqlIncedata.sqlexecbyinception(nTaskid, nRightUserid)
            return HttpResponseRedirect("/mysql/mysqlfinishtask/")

def sqlexecnoince(req):
    if not req.session.get("sess_userid", False):
        return HttpResponseRedirect("/login/")
    else:
        nUrldata = req.path
        nRightUserid = req.session["sess_userid"]
        nHaveRight = Right.userrightcheck(nRightUserid, nUrldata)
        if nHaveRight[0]["num"] == 0:
            return HttpResponseRedirect("/noright/")
        else:
            nTaskid = req.GET['taskid']
            nRightUserid = req.session["sess_userid"]
            MysqlIncedata.sqlexecnoince(nTaskid, nRightUserid)
            return HttpResponseRedirect("/mysql/mysqlfinishtask/")

def sqltaskdelete(req):
    if not req.session.get("sess_userid", False):
        return HttpResponseRedirect("/login/")
    else:
        nUrldata = req.path
        nRightUserid = req.session["sess_userid"]
        nHaveRight = Right.userrightcheck(nRightUserid, nUrldata)
        if nHaveRight[0]["num"] == 0:
            return HttpResponseRedirect("/noright/")
        else:
            nTaskid = req.GET['taskid']
            MysqlIncedata.sqltaskdelete(nTaskid)
            return HttpResponseRedirect("/mysql/tobeexecutemysqltask/")


def sqlresultselect(req):
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
                datalist = ''
                return render_to_response('mysqlincedata/mysql-resultselect.html', {'data': datalist})
            else:
                nContentinfo = req.POST.get('contentinfo')
                nSelectDate = req.POST.get('selecttime')
                print nContentinfo,nSelectDate


                datalist = MysqlIncedata.sqlresultselect(nContentinfo, nSelectDate)
                return render_to_response('mysqlincedata/mysql-resultselect.html', {'data': datalist, 'num1':nSelectDate, 'num2':nContentinfo})
