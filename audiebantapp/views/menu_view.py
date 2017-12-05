#! /usr/bin/env python
# -*- coding: utf-8 -*-
# create by zhangsp 2017-07026

from django.http import HttpResponseRedirect
from django.shortcuts import render_to_response
from audiebantapp.model.menu_model import Memu
from audiebantapp.model.right_model import Right


def menulist(req):
    if not req.session.get("sess_userid", False ):
        return HttpResponseRedirect("/login/")
    else:
        nUrldata = req.path
        nRightUserid = req.session["sess_userid"]
        nHaveRight = Right.userrightcheck(nRightUserid, nUrldata)
        if nHaveRight[0]["num"] == 0:
            return HttpResponseRedirect("/noright/")
        else:
            datalist = Memu.menulist()
            return render_to_response('menu/menu-list.html', {'data': datalist})


def menuadd(req):
    if not req.session.get("sess_userid", False):
        return HttpResponseRedirect("/login/")
    else:
        nUrldata = req.path
        print nUrldata
        nRightUserid = req.session["sess_userid"]
        nHaveRight = Right.userrightcheck(nRightUserid, nUrldata)
        if nHaveRight[0]["num"] == 0:
            return HttpResponseRedirect("/noright/")
        else:
            if req.method == 'GET':
                datalist = Memu.menubeforeadd()
                return render_to_response('menu/menu-add.html', {'data': datalist})
            else:
                nUserid = req.session["sess_userid"]
                nMenuname = req.POST.get('menuname')
                nParentid = int(req.POST.get('parentid'))
                if any(req.POST.get('parentid')):
                    nStyletype = 0
                nAction = req.POST.get('action')
                nStyletype= req.POST.get('styletype')
                nStatus = int(req.POST.get('status'))
                nOrdersort = int(req.POST.get('ordersort'))

                Memu.menuadd(nMenuname, nParentid, nAction, nStyletype, nStatus, nOrdersort)
                return HttpResponseRedirect('/menu/menulist/')


def menuupdate(req):
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
                nMenuid = req.GET['menuid']
                menuinfo = Memu.menubeforeupdate(nMenuid)
                datalist = Memu.menubeforeadd()
                return render_to_response('menu/menu-update.html', {'data': datalist, 'datas': menuinfo})
            else:
                nMenuid = req.POST.get('menuid')
                nMenuname = req.POST.get('menuname')
                nParentid = req.POST.get('parentid')
                nAction = req.POST.get('action')
                nStyletype = req.POST.get('styletype')
                nStatus = int(req.POST.get('status'))
                nOrdersort = int(req.POST.get('ordersort'))

                Memu.menuupdate(nMenuid, nMenuname, nParentid, nAction, nStyletype, nStatus, nOrdersort)
                return HttpResponseRedirect('/menu/menulist/')


def menudelete(req):
    if not req.session.get("sess_userid", False):
        return HttpResponseRedirect("/login/")
    else:
        nUrldata = req.path
        nRightUserid = req.session["sess_userid"]
        nHaveRight = Right.userrightcheck(nRightUserid, nUrldata)
        if nHaveRight[0]["num"] == 0:
            return HttpResponseRedirect("/noright/")
        else:
            nUserid = req.session["sess_userid"]
            nMenuid = req.GET['menuid']
            Memu.menudelete(nMenuid)
            return HttpResponseRedirect('/menu/menulist/')
