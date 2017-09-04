#coding:utf-8
__author__ = 'mwy'
__date__ = '2017/7/31 15:24'

# list_display = ['name', 'add_time','desc']
# search_fields = ['name','desc']
# list_filter = ['name', 'add_time','desc']
import xadmin
from .models import  UserAsk, CourseComments, UserFavourate, UserMessage, UserCourse

class UserAskAdmin(object):
    list_display = ['name', 'mobile','course_name','add_time']
    search_fields = ['name', 'mobile','course_name']
    list_filter = ['name', 'mobile','course_name','add_time']

class CourseCommentsAdmin(object):
    list_display = ['user', 'course', 'comments', 'add_time']
    search_fields = ['user', 'course', 'comments']
    list_filter = ['user', 'course', 'comments', 'add_time']
    pass

class UserFavourateAdmin(object):
    list_display = ['user', 'fav_id', 'fav_type', 'add_time']
    search_fields = ['user', 'fav_id', 'fav_type']
    list_filter = ['user', 'fav_id', 'fav_type', 'add_time']

class UserMessageAdmin(object):
    list_display = ['user', 'message', 'has_read', 'add_time']
    search_fields = ['user', 'message', 'has_read']
    list_filter = ['user', 'message', 'has_read', 'add_time']

class UserCourseAdmin(object):
    list_display = ['user', 'course', 'add_time']
    search_fields = ['user', 'course']
    list_filter = ['user', 'course', 'add_time']



xadmin.site.register(UserAsk, UserAskAdmin)
xadmin.site.register(CourseComments, CourseCommentsAdmin)
xadmin.site.register(UserFavourate,UserFavourateAdmin)
xadmin.site.register(UserMessage, UserMessageAdmin)
xadmin.site.register(UserCourse,UserCourseAdmin)