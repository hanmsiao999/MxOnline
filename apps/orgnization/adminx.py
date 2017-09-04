#coding:utf-8
__author__ = 'mwy'
__date__ = '2017/7/31 15:17'

# list_display = ['course', 'name','download', 'add_time']
# search_fields = ['course', 'name','download']
# list_filter = ['course', 'name','download', 'add_time']

import xadmin
from .models import CityDict, CourseOrg, Teacher

class CityDictAdmin(object):
    list_display = ['name', 'add_time','desc']
    search_fields = ['name','desc']
    list_filter = ['name', 'add_time','desc']

class CourseOrgAdmin(object):
    # list_display = ['name', 'dec', 'click_num','fav_num','address','city','add_time','tag']
    # search_fields = ['name', 'dec', 'click_num','fav_num','address','city','tag']
    # list_filter = ['name', 'dec', 'click_num','fav_num','address','city','add_time','tag']
    list_display = ['name','dec','click_num','fav_num','courses_num','get_course_num']
    search_fields = ['name','dec','click_num','fav_num']
    list_filter = ['name','dec','click_num','fav_num']
    relfield_style = 'fk-ajax'

class TeacherAdmin(object):
    list_display = ['org', 'name', 'work_years', 'work_company', 'work_position', 'trait', 'click_num','fav_num','add_time']
    search_fields = ['org', 'name', 'work_years', 'work_company', 'work_position', 'trait', 'click_num','fav_num']
    list_filter = ['org', 'name', 'work_years', 'work_company', 'work_position', 'trait', 'click_num','fav_num','add_time']

xadmin.site.register(CityDict, CityDictAdmin)
xadmin.site.register(CourseOrg, CourseOrgAdmin)
xadmin.site.register(Teacher,TeacherAdmin)