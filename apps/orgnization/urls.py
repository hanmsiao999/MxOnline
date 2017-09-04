#coding:utf-8
__author__ = 'mwy'
__date__ = '2017/8/3 19:05'

from django.conf.urls import url, include

from .views import *
    #OrgView, AddUserAskView, OrgHomeView, OrgCourseView, OrgIntroductionView, OrgTeaccherView, AddFavView

urlpatterns = [
    # 课程机构列表页
    url(r'^list/$', OrgView.as_view(), name='org_list'),
    url(r'^add_ask/$', AddUserAskView.as_view(), name='add_ask'),
    url(r'^home/(?P<org_id>\d+)/$',OrgHomeView.as_view(), name='org_home'),
    url(r'^course/(?P<org_id>\d+)/$',OrgCourseView.as_view(), name='org_course'),
    url(r'^introduction/(?P<org_id>\d+)/$',OrgIntroductionView.as_view(), name='org_Introduction'),
    url(r'^org_teacher/(?P<org_id>\d+)/$', OrgTeacherView.as_view(), name='org_teacher'),
    # 机构收藏
    url(r'^add_fav/$', AddFavView.as_view(), name='add_fav'),
    # 教师相关
    url(r'^teacher/list/$', TeacherListView.as_view(), name='teacher_list'),
    url(r'^teacher/detail/(?P<teacher_id>\d+)/$', TeacherDetailView.as_view(), name='teacher_detail'),


]