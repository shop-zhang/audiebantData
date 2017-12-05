#!/usr/bin/env python
#-*- coding: utf-8 -*-
# create by zhangsp 2016-06-06

from django.conf.urls import url
from audiebantapp.views import login_view
from audiebantapp .views import menu_view
from audiebantapp .views import user_view
from audiebantapp .views import right_view
from audiebantapp .views import icon_view
from audiebantapp .views import server_view
from audiebantapp .views import dbserver_view
from audiebantapp .views import mysqlincedata_view
from audiebantapp .views import monitor_view
from audiebantapp .views import mysqladvisor_view

urlpatterns = [
    url(r'^login/$', login_view.login, name='login'),
    url(r'^logout/$', login_view.logout, name='logout'),
    url(r'^dashboard/$', login_view.dashboard, name='dashboard'),
    url(r'^noright/', login_view.noright, name='noright'),
    url(r'^updatepwd/', login_view.updatepwd, name='updatepwd'),

    url(r'^menu/menulist/', menu_view.menulist, name='menulist'),
    url(r'^menu/menuadd/', menu_view.menuadd, name='menuadd'),
    url(r'^menu/menuupdate$', menu_view.menuupdate, name='menuupdate'),
    url(r'^menu/menudelete$', menu_view.menudelete, name='menudelete'),

    url(r'^user/userlist/', user_view.userlist, name='userlist'),
    url(r'^user/useradd/', user_view.useradd, name='useradd'),
    url(r'^user/userupdate$', user_view.userupdate, name='userupdate'),
    url(r'^user/userdelete$', user_view.userdelete, name='userdelete'),

    url(r'^right/rightlist/', right_view.rightlist, name='rightlist'),
    url(r'^right/rightadd/', right_view.rightadd, name='rightadd'),
    url(r'^right/rightupdate$', right_view.rightupdate, name='rightupdate'),
    url(r'^right/rightdelete$', right_view.rightdelete, name='rightdelete'),
    url(r'^right/rightgiveuser$', right_view.rightgiveuser, name='rightgiveuser'),
    url(r'^right/adduserright$', right_view.adduserright, name='adduserright'),
    url(r'^left/$', right_view.left, name='left'),

    url(r'^server/serverlist/', server_view.serverlist, name='serverlist'),
    url(r'^server/serveradd/', server_view.serveradd, name='serveradd'),
    url(r'^server/serverupdate$', server_view.serverupdate, name='serverupdate'),
    url(r'^server/serverdelete$', server_view.serverdelete, name='serverdelete'),

    url(r'^server/servergetinfo$', server_view.servergetinfo, name='servergetinfo'),
    url(r'^server/serveruselist/', server_view.serveruselist, name='serveruselist'),
    url(r'^server/serveruseupdate$', server_view.serveruseupdate, name='serveruseupdate'),
    url(r'^server/serveruseadd/', server_view.serveruseadd, name='serveruseadd'),

    url(r'^server/servergrouplist/', server_view.servergrouplist, name='servergrouplist'),
    url(r'^server/servergroupadd/', server_view.servergroupadd, name='servergroupadd'),
    url(r'^server/servergroupdelete$', server_view.servergroupdelete, name='servergroupdelete'),
    url(r'^server/servergroupupdate$', server_view.servergroupupdate, name='servergroupupdate'),

    url(r'^dbserver/dbserverlist/', dbserver_view.dbserverlist, name='dbserverlist'),
    url(r'^dbserver/dbserverupdate$', dbserver_view.dbserverupdate, name='dbserverupdate'),
    url(r'^dbserver/dbserveradd/', dbserver_view.dbserveradd, name='dbserveradd'),
    url(r'^dbserver/dbserverdelete$', dbserver_view.dbserverdelete, name='dbserverdelete'),

    url(r'^monitorredis/redislist/', monitor_view.redislist, name='redislist'),
    url(r'^monitorredis/redisgraphinfo$', monitor_view.redisgraphinfo, name='redisgraphinfo'),
    url(r'^monitormysql/mysqlmonitorlist/', monitor_view.mysqlmonitorlist, name='mysqlmonitorlist'),
    url(r'^monitormysql/mysqlgraphinfo$', monitor_view.mysqlgraphinfo, name='mysqlgraphinfo'),

    url(r'^mysqlsql/mysqllist/', mysqlincedata_view.mysqllist, name='mysqllist'),
    url(r'^mysqlsql/mysqlsqltask/', mysqlincedata_view.mysqlsqltask, name='mysqlsqltask'),
    url(r'^mysqlsql/mysqlfinishtask/', mysqlincedata_view.mysqlfinishtask, name='mysqlfinishtask'),
    url(r'^mysqlsql/tobeexecutemysqltask/', mysqlincedata_view.tobeexecutemysqltask, name='tobeexecutemysqltask'),
    url(r'^mysqlsql/sqlcontentinfo$', mysqlincedata_view.sqlcontentinfo, name='sqlcontentinfo'),
    url(r'^mysqlsql/sqlcheckresult$', mysqlincedata_view.sqlcheckresult, name='sqlcheckresult'),
    url(r'^mysqlsql/sqlexecresult$', mysqlincedata_view.sqlexecresult, name='sqlexecresult'),
    url(r'^mysqlsql/sqlcontentupdate$', mysqlincedata_view.sqlcontentupdate, name='sqlcontentupdate'),
    url(r'^mysqlsql/sqlexecbyinception$', mysqlincedata_view.sqlexecbyinception, name='sqlexecbyinception'),
    url(r'^mysqlsql/sqlexecnoince$', mysqlincedata_view.sqlexecnoince, name='sqlexecnoince'),
    url(r'^mysqlsql/sqltaskdelete$', mysqlincedata_view.sqltaskdelete, name='sqltaskdelete'),

    url(r'^mysqlindex/sqlauditinglist/', mysqladvisor_view.sqlauditinglist, name='sqlauditinglist'),
    url(r'^mysqlindex/sqlauditingadd/', mysqladvisor_view.sqlauditingadd, name='sqlauditingadd'),
    url(r'^mysqlindex/sqladvisorinfo$', mysqladvisor_view.sqladvisorinfo, name='sqladvisorinfo'),

    url(r'^icon/', icon_view.icon, name='icon'),

    url('$', login_view.login, name='login'),
]