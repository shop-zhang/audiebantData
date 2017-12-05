#! /usr/bin/env python
# -*- coding: utf-8 -*-
# create by zhangsp 2017-07-26

from django.http import HttpResponseRedirect
from django.shortcuts import render_to_response
from audiebantapp.model.user_model import User
from audiebantapp.model.right_model import Right


def userlist(req):
    if not req.session.get( "sess_userid", False ):
        return HttpResponseRedirect("/login/")
    else:
        nUrldata = req.path
        nRightUserid = req.session["sess_userid"]
        nHaveRight = Right.userrightcheck(nRightUserid, nUrldata)
        if nHaveRight[0]["num"] == 0:
            return HttpResponseRedirect("/noright/")
        else:
            datalist = User.userlist()
            return render_to_response('user/user-list.html', {'data': datalist})

def useradd(req):
    if not req.session.get( "sess_userid", False ):
        return HttpResponseRedirect("/login/")
    else:
        nUrldata = req.path
        nRightUserid = req.session["sess_userid"]
        nHaveRight = Right.userrightcheck(nRightUserid, nUrldata)
        if nHaveRight[0]["num"] == 0:
            return HttpResponseRedirect("/noright/")
        else:
            if req.method == 'GET':
                    return render_to_response('user/user-add.html')
            else:
                nUserid = req.session["sess_userid"]
                nLoginname= req.POST.get('loginname')
                nLoginpwd = req.POST.get('loginpwd')
                nUsername = req.POST.get('username')
                nUseremail = req.POST.get('useremail')
                nUsermobile = req.POST.get('usermobile')
                nUserrole = int(req.POST.get('userrole'))
                nUserdepartment = req.POST.get('userdepartment')
                nStatus = int(req.POST.get('status'))

                User.useradd(nLoginname, nLoginpwd, nUsername, nUseremail, nUsermobile, nUserrole, nUserdepartment, nStatus)
                return HttpResponseRedirect('/user/userlist/')

def userupdate(req):
    if not req.session.get( "sess_userid", False ):
        return HttpResponseRedirect("/login/")
    else:
        nUrldata = req.path
        nRightUserid = req.session["sess_userid"]
        nHaveRight = Right.userrightcheck(nRightUserid, nUrldata)
        if nHaveRight[0]["num"] == 0:
            return HttpResponseRedirect("/noright/")
        else:
            if req.method == 'GET':
                nNewUserid = req.GET['userid']
                datalist = User.userbeforeupdate(nNewUserid)
                return render_to_response('user/user-update.html', {'data': datalist})
            else:
                nNewUserid = req.POST.get('olduserid')
                nLoginname = req.POST.get('loginname')
                nLoginpwdold= req.POST.get('oldpwd')
                if req.POST.get('loginpwd')=='':
                    nLoginpwd = nLoginpwdold
                else:
                    nLoginpwd=req.POST.get('loginpwd')
                nUsername = req.POST.get('username')
                nUseremail = req.POST.get('useremail')
                nUsermobile = req.POST.get('usermobile')
                nUserdepartment = req.POST.get('userdepartment')
                nUserrole = req.POST.get('userrole')
                nStatus = req.POST.get('status')

                User.userupdate(nLoginname, nLoginpwd, nUsername, nUseremail, nUsermobile, nUserdepartment, nUserrole, nStatus, nNewUserid)
                return HttpResponseRedirect('/user/userlist/')


def userdelete(req):
    if not req.session.get( "sess_userid", False ):
        return HttpResponseRedirect("/login/")
    else:
        nUrldata = req.path
        nRightUserid = req.session["sess_userid"]
        nHaveRight = Right.userrightcheck(nRightUserid, nUrldata)
        if nHaveRight[0]["num"] == 0:
            return HttpResponseRedirect("/noright/")
        else:
            nNewuserid = req.GET['userid']
            User.userdelete(nNewuserid)
            return HttpResponseRedirect('/user/userlist/')