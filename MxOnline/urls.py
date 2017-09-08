#coding:utf-8
"""MxOnline URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.9/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Add an import:  from blog import urls as blog_urls
    2. Import the include() function: from django.conf.urls import url, include
    3. Add a URL to urlpatterns:  url(r'^blog/', include(blog_urls))
"""
from django.conf.urls import url, include
from django.views.generic import TemplateView
from django.views.static import serve

import xadmin


from users.views import RegisterView, ActiveUserView,LoginView,ForgetPwdView, RestPasswordView, MainPageView,Logout,DealWithErrorView
from orgnization.views import  OrgView
from MxOnline.settings import MEDIA_ROOT#, STATIC_ROOT

urlpatterns = [
    url(r'server_error',DealWithErrorView.as_view(),name="serverError"),
    url(r'^xadmin/', xadmin.site.urls),
    url(r'^$', MainPageView.as_view(), name="index"),
    #url(r'^login/$',userlogin, name="login")
    url(r'^login/$',LoginView.as_view() , name="login"),
    url(r'^logout/$',Logout.as_view() , name="logout"),
    url(r'^register/$', RegisterView.as_view(), name="register"),
    url(r'^captcha/', include('captcha.urls')),
    url(r'^active/(?P<active_code>.*)/$', ActiveUserView.as_view(), name='useractive'),
    url(r'^reset/(?P<reset_code>.*)/$', RestPasswordView.as_view(), name='resetpassword'),
    url(r'^Modifypassword/$', RestPasswordView.as_view(), name='Modifypassword'),
    url(r'^forget/$', ForgetPwdView.as_view(), name='forget_pwd'),
    # 配置上传文件的访问处理
    #url(r'^media/(?P<path>.*)', serve, {"document_root":MEDIA_ROOT}),
    #url(r'^static/(?P<path>.*)', serve, {"document_root":STATIC_ROOT}),
    # 课程机构ur配置
    url(r'^org/', include('orgnization.urls',namespace="org")),
    # 课程URL配置
     url(r'^course/', include('courses.urls',namespace="course")),
    # 用户url 配置
    url(r'^user/', include('users.urls',namespace="user")),
    # 富文本url配置
    url(r'^ueditor/', include('DjangoUeditor.urls'))
]

# 配置全局404页面
handler404 = "users.views.page_not_found"
handler500 = "users.views.server_error"
