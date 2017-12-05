#! /usr/bin/env python
# -*- coding: utf-8 -*-
# create by zhangsp 2017-07-26

from django.http import HttpResponseRedirect
from django.shortcuts import render_to_response
from audiebantapp.model.right_model import Right
from audiebantapp.model.user_model import User


def rightlist(req):
    if not req.session.get("sess_userid", False):
        return HttpResponseRedirect("/login/")
    else:
        nUrldata = req.path
        nRightUserid = req.session["sess_userid"]
        nHaveRight = Right.userrightcheck(nRightUserid, nUrldata)
        if nHaveRight[0]["num"] == 0:
            return HttpResponseRedirect("/noright/")
        else:
            nRightuserid = 0
            userinfo = Right.getrightusers(nRightuserid)
            userlen = len(userinfo)
            datalist = Right.rightlist()
            return render_to_response('right/right-list.html', {'data': datalist, 'datas': userlen})


def rightadd(req):
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
                    datalist = Right.rightbeforeadd()
                    return render_to_response('right/right-add.html', {'data': datalist})
            else:
                nUserid = req.session["sess_userid"]
                nRightname = req.POST.get('rightname')
                nMneuid = int(req.POST.get('menuid'))
                nAction = req.POST.get('action')
                nStatus = int(req.POST.get('status'))

                Right.rightadd(nRightname, nAction, nStatus, nMneuid)
                return HttpResponseRedirect('/right/rightlist/')


def rightupdate(req):
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
                nRightid = req.GET['rightsid']
                rightinfo = Right.rightbeforeupdate(nRightid)
                datalist = Right.rightbeforeadd()
                return render_to_response('right/right-update.html', {'data': datalist, 'datas': rightinfo})
            else:
                nUserid = req.session["sess_userid"]
                nRightid = req.GET['rightsid']
                nRightname = req.POST.get('rightname')
                nMenuid = req.POST.get('menuid')
                nAction = req.POST.get('action')
                nStatus = int(req.POST.get('status'))

                Right.rightupdate(nRightname, nAction, nStatus, nMenuid, nRightid)
                return HttpResponseRedirect('/right/rightlist/')


def rightdelete(req):
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
            return HttpResponseRedirect('/right/rightlist/')


def left(req):
    nRightuserid = req.session["sess_userid"]
    nRightuserrole = req.session["sess_userrole"]
    datalist = Right.leftmenuright(nRightuserid,nRightuserrole)
    return render_to_response('left.html', {'data': datalist})


def rightgiveuser(req):
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
                nRightuserid = req.GET['userid']
                userinfo = Right.getrightusers(nRightuserid)
                data = Right.getallright(nRightuserid)
                return render_to_response('right/right-giveuser.html', {'data': data, 'datas': userinfo})
            else:
                nUserid = req.session["sess_userid"]
                nRightidList = req.POST.get('rightsid')
                nRightuserName= req.POST.get('username')
                print nRightuserName
                nRightuserId = User.getUserIdbyUsername(nRightuserName)
                print "nRightuserId="
                print nRightuserId

                Right.userrightupdate(nRightuserId,nRightidList)
                return HttpResponseRedirect('/user/userlist/')


def adduserright(req):
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
                nRightuserid = 0
                userinfo = Right.getrightusers(nRightuserid)

                data = Right.getallright(nRightuserid)
                return render_to_response('right/right-adduserright.html', {'data': data, 'datas': userinfo})
            else:
                nUserid = req.session["sess_userid"]
                nRightidList = req.POST.get('rightsid')
                nRightuserName= req.POST.get('username')
                nRightuserId = User.getUserIdbyUsername(nRightuserName)

                Right.userrightupdate(nRightuserId,nRightidList)
                return HttpResponseRedirect('/user/userlist/')