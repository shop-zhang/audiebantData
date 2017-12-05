#!/usr/bin/env python
#-*- coding: utf-8 -*-
# create by zhangsp 2016-06-06

from django.http import HttpResponseRedirect
from django.shortcuts import render_to_response,RequestContext
from audiebantapp.model.login_model import Login


def login(req):
    if req.method == 'GET':
        return render_to_response('login.html',context_instance=RequestContext(req))
    else:
        nUsername = req.POST.get('username')
        nPasswd = req.POST.get('password')
        AccountNum=Login.checklogindata(nUsername,nPasswd)
        row=AccountNum[0]
        if row["num"] == 1:
            AccountData = Login.usersessiondata(nUsername, nPasswd)
            rows=AccountData[0]
            if rows["isforbid"] == 1:
                req.session["sess_userid"] = rows["userid"]
                req.session["sess_username"] = nUsername
                req.session["sess_userrole"] = rows["userrole"]
                return HttpResponseRedirect("/dashboard/")
            else:
                messagedata=[]
                messagedata.append('this account is forbiden,plaese get message from administor')
                return HttpResponseRedirect("login.html", {'message':messagedata} )
        else:
            messagedata = []
            messagedata.append( 'user or passwd is error' )
            return HttpResponseRedirect("/index/",{'message':messagedata})


def logout(req):
    if not req.session.get( "sess_userid", False ):
        messagedata = '需要登录才可以访问'
        return HttpResponseRedirect( "/login/", {'message':messagedata} )
    else:
        del req.session["sess_userid"]
        del req.session["sess_username"]
        del req.session["sess_userrole"]
        return HttpResponseRedirect("/login/")


def updatepwd(req):
    if not req.session.get( "sess_userid", False ):
        messagedata = '需要登录才可以访问'
        return HttpResponseRedirect( "/login/", {'message':messagedata} )
    else:
        if req.method == 'GET':
            return render_to_response('user/user-updatepwd.html')
        else:
            userid = req.session["sess_userid"]
            nPasswd = req.POST.get('password')
            Login.updatepwd(nPasswd, userid)
            return HttpResponseRedirect("/dashboard/")


def dashboard(req):
    if not req.session.get("sess_userid", False):
        return HttpResponseRedirect("/login/")
    else:
        if not req.session.get( "sess_userid", False ):
            messagedata = '需要登录才可以访问'
            return HttpResponseRedirect( "/login/", {'message': messagedata} )
        else:
            UserRole = req.session["sess_userrole"]
            return render_to_response('dashboard.html',{'datas': UserRole})


def noright(req):
    return render_to_response('page-noright.html')