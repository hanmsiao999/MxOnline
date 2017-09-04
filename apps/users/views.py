#coding:utf-8
from django.shortcuts import render
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.backends import ModelBackend
from django.core.validators import validate_email
from django.core.exceptions import ValidationError
from django.db.models import Q
from django.views.generic.base import View
from django.contrib.auth.hashers import make_password
from django.http import HttpResponse, HttpResponseRedirect
from django.core.urlresolvers import reverse
from pure_pagination import Paginator, EmptyPage, PageNotAnInteger

import json

from .models import  UserProfile, EmailVerifyRecord, Banner
from operation.models import UserFavourate, UserMessage
from orgnization.models import Teacher, CourseOrg
from courses.models import Course
from .forms import loginForm, RegisterForm, ForgetForm, ModifyPwdForm, ImageUpLoadForm, UserInfoForm
from utils.email_send import send_register_email
from utils.mixin_utils import LoginRequiredMixin

class CustomBackend(ModelBackend):
    def authenticate(self, username=None, password=None, **kwargs):
        try:
            user = UserProfile.objects.get(Q(username=username)|Q(email=username))
            if user.check_password(password):
                return user
        except Exception as ex:
            return None

# Create your views here.
class DealWithErrorView(View):
    def get(self, request):
        return render(request, "500.html")



class MainPageView(View):
    def get(self, request):
        #raise Exception("test")
        all_course = Course.objects.filter(is_banner=False)[:6]
        banner_course = Course.objects.filter(is_banner=True)[:3]
        #print (1/0)
        banners = Banner.objects.all().order_by("index")
        org = CourseOrg.objects.all()[:15]
        return render(request, "index.html",{
            'all_course':all_course,
            'banner_courses':banner_course,
            'banners':banners,
            'orgs':org,
        })

def userlogin(request):
    if request.method == 'POST':
        username = request.POST.get("username", "")
        password = request.POST.get("password", "")
        user = authenticate(username=username, password=password)
        if user:
            if user.is_active:
                login(request ,user)
                return render(request, "index.html")
            else:
                return render(request, "login.html", {'msg': '用户未激活'})
        else:
            return  render(request, "login.html", {'msg':'用户名或密码错误'})

    return render(request, template_name="login.html")


class Logout(LoginRequiredMixin, View):
    def get(self, request):
        logout(request)
        return HttpResponseRedirect(reverse("index"))



class LoginView(View):
       def get(self, request):
           return render(request, template_name="login.html")

       def post(self, request):
           log_form = loginForm(request.POST)
           if log_form.is_valid():
               username = request.POST.get("username", "")
               password = request.POST.get("password", "")
               user = authenticate(username=username, password=password)
               if user:
                   if  user.is_active:
                       self.login = login(request, user)
                       return HttpResponseRedirect(reverse("index"))
                   else:
                       return render(request, "check_email.html", {'user': user})
                       #return render(request, "login.html", {'msg': '用户未激活','user':user})
               else:
                   return render(request, "login.html", {'msg': '用户名或密码错误'})
           else:
               return render(request, "login.html", {'login_form':log_form })


class RegisterView(View):
       def post(self, request):
           post_register_form = RegisterForm(request.POST)
           if post_register_form.is_valid():
               username = request.POST.get("username", "")
               if '@' in username:
                   return render(request, "register.html", {'register_form': post_register_form, 'msg': '用户名存在非法字符'})
               if UserProfile.objects.filter(username = username ,is_active=True):
                   return render(request, "register.html", {'register_form': post_register_form,'msg': '用户名已经存在'})
               elif UserProfile.objects.filter(username = username ,is_active=False):
                   user = UserProfile.objects.get(username = username)
                   return render(request, "check_email.html", {'user': user})
               else:
                   password = request.POST.get("password", "")
                   user = UserProfile(username=username,
                                      password=make_password(password))
                   user.is_active = False
                   user.save()
                   #send_register_email(username, "register")

                   #return render(request, "login.html")
                   # 进入激活页面
                   return render(request, "check_email.html",{'user': user})
           else:
               return render(request, "register.html", {'register_form': post_register_form})

       def get(self, request):
           register_form = RegisterForm()
           return render(request, "register.html", {'register_form':register_form})


class ActiveUserView(View):
    # def get(self, request, active_code):
    #     all_record = EmailVerifyRecord.objects.filter(code = active_code)
    #     if all_record:
    #         for record in all_record:
    #             email = record.email
    #             user = UserProfile.objects.get(email = email)
    #             user.is_active = True
    #             user.save()
    #     else:
    #         return render(request,"active_fail.html")
    #     return render(request, "login.html")
    def post(self, request):
        active_code = request.POST.get("code","")
        username = request.POST.get("username", "")
        email = request.POST.get("email","")
        user = UserProfile.objects.get(username=username)
        if active_code == "":
            try:
                validate_email(email)
            except ValidationError as ex:
                return render(request, "check_email.html",{'user': user,'msg':"邮箱格式错误",'email':email})
            send_register_email(email, "register")
            return render(request, "check_email.html", {'user': user, 'msg': "邮件已发送注意查收",'email':email})
        else:
            all_record = EmailVerifyRecord.objects.filter(code=active_code,email=email)
            if all_record:
                for record in all_record:
                            user.email = email
                            user.is_active = True
                            user.save()
                return render(request, "login.html")
            else:
                return render(request, "check_email.html", {'user': user, 'msg_code': "验证码错误",'email':email})


class RestPasswordView(View):
    def get(self, request, reset_code):
        all_records = EmailVerifyRecord.objects.filter(code=reset_code)
        if all_records:
            for record in all_records:
                email = record.email
                return render(request, "password_reset.html", {'email': email})

    def post(self, request):
        modify_pwd_form = ModifyPwdForm(request.POST)
        if modify_pwd_form.is_valid():
            password1 = request.POST.get("password1","")
            password2 = request.POST.get("password2", "")
            email = request.POST.get("email", "")
            if password1!=password2:
                return render(request, "password_reset.html", {'email': email, 'msg': '输入密码不一致'})
            user = UserProfile.objects.get(email=email)
            user.password = make_password(password1)
            user.save()
            return render(request, "login.html")
        else:
            email = request.POST.get("email", "")
            return render(request, "password_reset.html", {'email': email, 'modify_pwd_form':modify_pwd_form})











class ForgetPwdView(View):
    def get(self, request):
        forget_form = ForgetForm()
        return render(request, "forgetpwd.html",{'forgetform':forget_form})

    def post(self, request):
        forget_form = ForgetForm(request.POST)
        if forget_form.is_valid():
            email = request.POST.get("email", "")
            user = UserProfile.objects.filter(email=email)
            if not user:
                return render(request, "forgetpwd.html", {'msg': '该用户不存在','forgetform': forget_form })
            else:
                send_register_email(email, 'forget')
                return render(request, "send_success.html")
        else:
            return render(request, "forgetpwd.html", {'forgetform': forget_form})


class UserInfoView(LoginRequiredMixin, View):
    """
    用户信息
    """
    def get(self, request):
        return render(request, "usercenter-info.html")

    def post(self, request):
        """
        修改用户信息
        :param request: 
        :return: 
        """
        userInfo_form = UserInfoForm(request.POST, instance=request.user)
        if userInfo_form.is_valid():
            userInfo_form.save()
            reStr = {"status":"success"}
            return HttpResponse(json.dumps(reStr), content_type="application/json")
        else:
            return HttpResponse(json.dumps(userInfo_form.errors), content_type="application/json")


class UserCourseView(LoginRequiredMixin, View):
    """
    用户课程
    """
    def get(self, request):
        return render(request, "usercenter-mycourse.html")


class UserFavView(LoginRequiredMixin, View):
    def get(self, request):
        category = request.GET.get("category")
        if category == 'org' or category == None:
            fav_orgs = UserFavourate.objects.filter(user=request.user, fav_type=2)
            fav_orgs = [item.fav_id for item in fav_orgs]
            fav_orgs = CourseOrg.objects.filter(id__in=fav_orgs)
            return render(request, "usercenter-fav-org.html",{
                'fav_orgs':fav_orgs
            })
        elif category == 'course':
            fav_courses = UserFavourate.objects.filter(user=request.user, fav_type=1)
            fav_courses = [item.fav_id for item in fav_courses]
            fav_courses = Course.objects.filter(id__in=fav_courses)
            return render(request, "usercenter-fav-course.html",{
                "fav_courses":fav_courses
            })
        elif category == 'teacher':
            fav_teachers = UserFavourate.objects.filter(user=request.user, fav_type=3)
            fav_teachers = [item.fav_id for item in fav_teachers]
            fav_teachers = Teacher.objects.filter(id__in=fav_teachers)

            return render(request, "usercenter-fav-teacher.html",{
                'fav_teachers':fav_teachers
            })


class UseFavDelete(LoginRequiredMixin, View):
    def post(self, request):
        try:
            fav_id = request.POST.get("fav_id", "")
            fav_type = request.POST.get("fav_type", "")
            object = UserFavourate.objects.filter(user=request.user, fav_id=fav_id, fav_type=fav_type)
            object.delete()
            reStr = {'status':'success'}
            reStr = json.dumps(reStr)
            return HttpResponse(reStr, content_type='application/json')
        except Exception as ex:
            reStr = {'status': 'fail'}
            reStr = json.dumps(reStr)
            return HttpResponse(reStr, content_type='application/json')


class UserMessageView(LoginRequiredMixin, View):
    def get(self, request):
        userMessage = UserMessage.objects.filter(user=request.user.id).order_by("-add_time")
        un_read  = userMessage.filter(has_read=False)
        for message in un_read:
            message.has_read=True
            message.save()
        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1
        p = Paginator(userMessage, 1, request=request)
        userMessage = p.page(page)
        return render(request, "usercenter-message.html",{
            "userMessage":userMessage
        })


class ImageUpLoadView(LoginRequiredMixin, View):
    def post(self, request):
        image_form = ImageUpLoadForm(request.POST, request.FILES)
        if image_form.is_valid():
            image = image_form.cleaned_data['image']
            request.user.image = image
            request.user.save()
            reStr = {'status':'success'}
            reStr = json.dumps(reStr)
            return HttpResponse(reStr,content_type="application/json")
        else:
            reStr = {'status': 'fail'}
            reStr = json.dumps(reStr)
            return HttpResponse(reStr, content_type="application/json")



class ModifyPasswordView(LoginRequiredMixin, View):
    """
    个人中心修改密码
    """
    def post(self, request):
        modify_pwd_form = ModifyPwdForm(request.POST)
        if modify_pwd_form.is_valid():
            password1 = request.POST.get("password1","")
            password2 = request.POST.get("password2", "")
            if password1!=password2:
                reStr = {'status': 'fail', 'msg':'密码不一致'}
                reStr = json.dumps(reStr)
                return HttpResponse(reStr, content_type="application/json")
            request.user.password = make_password(password1)
            request.user.save()
            reStr = {'status': 'success'}
            reStr = json.dumps(reStr)
            return HttpResponse(reStr, content_type="application/json")
        else:
            return HttpResponse(json.dumps(modify_pwd_form.errors), content_type="application/json")


class ChangeEmailView(View):
      def get(self, request):
          email = request.GET.get("email","")
          # 邮箱已经存在
          if UserProfile.objects.filter(email=email):
              reStr = {'email':'邮箱已经存在'}
              return HttpResponse(json.dumps(reStr), content_type="application/json")
          status = send_register_email(email, send_type="change_email")
          if status == 1:
              reStr = {'status':'success'}
          else:
              reStr = {'status': 'failure'}
          return HttpResponse(json.dumps(reStr), content_type="application/json")


      def post(self, request):
          code = request.POST.get("code","")
          email = request.POST.get("email", "")
          if EmailVerifyRecord.objects.filter(email=email, code=code, send_type='change_email'):
              request.user.email = email
              request.user.save()
              reStr = {'status': 'success'}
              return HttpResponse(json.dumps(reStr), content_type="application/json")
          else:
              reStr = {'status': 'fail', 'email':'邮箱或者验证码错误'}
              return HttpResponse(json.dumps(reStr), content_type="application/json")


def page_not_found(request):
    """
    页面404配置
    """
    from django.shortcuts import render_to_response
    response = render_to_response("404.html")
    response.status_code = 404
    return response


def server_error(request):
    """
    服务器500错误全局配置
    """
    from django.shortcuts import render_to_response
    response = render_to_response("500.html")
    response.status_code = 500
    return response
