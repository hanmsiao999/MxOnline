#coding:utf-8
__author__ = 'mwy'
__date__ = '2017/7/31 12:09'

import xadmin

from .models import EmailVerifyRecord, Banner

class EmailVerifyRecordAdmin(object):
        list_display = ['code','email','send_type','send_time']
        search_fields = ['code','email','send_type']
        list_filter = ['code','email','send_type']
        model_icon = "fa fa-user"

class BannerAdmin(object):
        list_display = ['title', 'image', 'url', 'index','add_time']
        search_fields = ['title', 'image', 'url', 'index']
        list_filter = ['title', 'image', 'url', 'index','add_time']

xadmin.site.register(EmailVerifyRecord,EmailVerifyRecordAdmin )
xadmin.site.register(Banner,BannerAdmin )