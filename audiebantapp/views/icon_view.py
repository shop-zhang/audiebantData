#! /usr/bin/env python
# -*- coding: utf-8 -*-
# create by zhangsp 2017-07-26

from django.http import HttpResponseRedirect
from django.shortcuts import render_to_response


def icon(req):
    if not req.session.get("sess_username", False):
        return HttpResponseRedirect("/login/")
    else:
        return render_to_response('icons.html')