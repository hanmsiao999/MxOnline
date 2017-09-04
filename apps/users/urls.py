#coding:utf-8
__author__ = 'mwy'
__date__ = '2017/8/10 18:14'

from django.conf.urls import url
from .views import *

urlpatterns = [
            url(r'^user_info/$', UserInfoView.as_view(), name='user_info'),
            url(r'^user_course/$',UserCourseView.as_view(),name='user_course' ),
            url(r'^user_fav/$',UserFavView.as_view(),name='user_fav'),
            url(r'^user_delete_fav/$',UseFavDelete.as_view(),name='user_delete_fav' ),
            url(r'^user_message/$',UserMessageView.as_view(),name='user_message' ),
            url(r'^image/uplpad/$', ImageUpLoadView.as_view(), name="image_upload"),
            url(r'^change_pwd/$', ModifyPasswordView.as_view(), name="change_pwd"),
            url(r'^change_email/$',ChangeEmailView.as_view() , name='ChangeEmail'),
            url(r'^user_active/$',ActiveUserView.as_view() , name='user_active'),

        ]