#coding:utf-8
__author__ = 'mwy'
__date__ = '2017/8/6 9:57'


from django.conf.urls import url, include

from .views import CourseListView, CourseDetailView, CourseLessonView, CourseCommentsView, VideoPlayView

urlpatterns = [
    # 课程机构列表页
    url(r'^list/$', CourseListView.as_view(), name='course_list'),
    url(r'^(?P<course_id>\d+)/$', CourseDetailView.as_view(), name='course_detail'),
    url(r'^lesson/(?P<course_id>\d+)/$', CourseLessonView.as_view(), name='course_lesson'),
    # 课程评论
     url(r'^comments/(?P<course_id>\d+)/$', CourseCommentsView.as_view(), name='course_comments'),
     url(r'^add_comment/$', CourseCommentsView.as_view(), name='add_comment'),
    # 视频地址
    url(r'^video/(?P<video_id>\d+)/$', VideoPlayView.as_view(), name='video_play'),
    # url(r'^add_ask/$', AddUserAskView.as_view(), name='add_ask'),
    # url(r'^home/(?P<org_id>\d+)/$',OrgHomeView.as_view(), name='org_home'),
    # url(r'^course/(?P<org_id>\d+)/$',OrgCourseView.as_view(), name='org_course'),
    # url(r'^introduction/(?P<org_id>\d+)/$',OrgIntroductionView.as_view(), name='org_Introduction'),
    # url(r'^teacher/(?P<org_id>\d+)/$', OrgTeaccherView.as_view(), name='org_teacher'),
    # # 机构收藏
    # url(r'^add_fav/$', AddFavView.as_view(), name='add_fav'),
]