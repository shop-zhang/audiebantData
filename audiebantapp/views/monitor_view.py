#! /usr/bin/env python
# -*- coding: utf-8 -*-
# create by zhangsp 2017-07-26

from django.http import HttpResponseRedirect
from django.shortcuts import render_to_response
from audiebantapp.model.monitor_model import Mmonitor
from audiebantapp.model.right_model import Right
import datetime, time

def redislist(req):
    if not req.session.get("sess_userid", False):
        return HttpResponseRedirect("/login/")
    else:
        nUrldata = req.path
        nRightUserid = req.session["sess_userid"]
        nHaveRight = Right.userrightcheck(nRightUserid, nUrldata)
        if nHaveRight[0]["num"] == 0:
            return HttpResponseRedirect("/noright/")
        else:
            datalist = Mmonitor.redislist()
            return render_to_response('monitor/redis-list.html', {'data': datalist})

def redisgraphinfo(req):
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
                nDbid = int(req.GET['dbid'])
                nEndtime = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
                nBegintime = time.strftime("%Y-%m-%d %H:%M:%S", time.localtime(time.time() - 24*60*60))
                datalist = Mmonitor.redislist()
                dataredisinfo = Mmonitor.redisinfo(nDbid)
                datagrephviewmen = Mmonitor.datagrephviewmen(nDbid, nBegintime, nEndtime)
                datagrephvieprocessllist= Mmonitor.datagrephvieprocessllist(nDbid, nBegintime, nEndtime)

                return render_to_response('monitor/redis-graph-info.html', {'data': datalist, 'datas': dataredisinfo, 'num5': nBegintime, 'num6': nEndtime, 'datamen': datagrephviewmen, 'dataprocesslist': datagrephvieprocessllist})
            else:
                nDbid = req.POST.get('dbid')
                nEndtime = req.POST.get('endtime')
                nBegintime = req.POST.get('begintime')
                datalist = Mmonitor.redislist()
                dataredisinfo = Mmonitor.redisinfo(nDbid)
                datagrephviewmen = Mmonitor.datagrephviewmen(nDbid, nBegintime, nEndtime)
                datagrephvieprocessllist = Mmonitor.datagrephvieprocessllist(nDbid, nBegintime, nEndtime)

                return render_to_response('monitor/redis-graph-info.html', {'data': datalist, 'datas': dataredisinfo, 'num5': nBegintime, 'num6': nEndtime, 'datamen': datagrephviewmen, 'dataprocesslist': datagrephvieprocessllist})

def mysqlmonitorlist(req):
    if not req.session.get("sess_userid", False):
        return HttpResponseRedirect("/login/")
    else:
        nUrldata = req.path
        nRightUserid = req.session["sess_userid"]
        nHaveRight = Right.userrightcheck(nRightUserid, nUrldata)
        if nHaveRight[0]["num"] == 0:
            return HttpResponseRedirect("/noright/")
        else:
            datalist = Mmonitor.redislist()
            return render_to_response('monitor/mysql-monitor-list.html', {'data': datalist})

def mysqlgraphinfo(req):
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
                nDbid = int(req.GET['dbid'])
                nEndtime = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
                nBegintime = time.strftime("%Y-%m-%d %H:%M:%S", time.localtime(time.time() - 24*60*60))
                datalist = Mmonitor.mysqllist()
                dataredisinfo = Mmonitor.mysqlinfo(nDbid)
                datagrephviewmen = Mmonitor.datagrephviewmen(nDbid, nBegintime, nEndtime)
                datagrephvieprocessllist= Mmonitor.datagrephvieprocessllist(nDbid, nBegintime, nEndtime)

                return render_to_response('monitor/redis-graph-info.html', {'data': datalist, 'datas': dataredisinfo, 'num5': nBegintime, 'num6': nEndtime, 'datamen': datagrephviewmen, 'dataprocesslist': datagrephvieprocessllist})
            else:
                nDbid = req.POST.get('dbid')
                nEndtime = req.POST.get('endtime')
                nBegintime = req.POST.get('begintime')
                datalist = Mmonitor.mysqllist()
                dataredisinfo = Mmonitor.mysqlinfo(nDbid)
                datagrephviewmen = Mmonitor.datagrephviewmen(nDbid, nBegintime, nEndtime)
                datagrephvieprocessllist = Mmonitor.datagrephvieprocessllist(nDbid, nBegintime, nEndtime)

                return render_to_response('monitor/redis-graph-info.html', {'data': datalist, 'datas': dataredisinfo, 'num5': nBegintime, 'num6': nEndtime, 'datamen': datagrephviewmen, 'dataprocesslist': datagrephvieprocessllist})
