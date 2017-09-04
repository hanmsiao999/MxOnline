#coding:utf-8
__author__ = 'mwy'
__date__ = '2017/8/1 6:55'

from django import forms
from captcha.fields import CaptchaField
from models import UserProfile
import re

class loginForm(forms.Form):
       # 名称和html 表单中name 保持一致
       username = forms.CharField(required=True)
       password = forms.CharField(required=True, min_length=5)


class RegisterForm(forms.Form):
       #email = forms.EmailField(required=True)
       username = forms.CharField(required=True, min_length=5)
       password = forms.CharField(required=True, min_length=5)
       captcha = CaptchaField(error_messages={'invalid':u"验证码错误"})


class ForgetForm(forms.Form):
       email = forms.EmailField(required=True)
       captcha = CaptchaField(error_messages={'invalid': u"验证码错误"})


class ModifyPwdForm(forms.Form):
       password1 = forms.CharField(required=True, min_length=5)
       password2 = forms.CharField(required=True, min_length=5)

class ImageUpLoadForm(forms.ModelForm):
       class Meta:
              model = UserProfile
              fields = ['image']


class UserInfoForm(forms.ModelForm):
       class Meta:
              model = UserProfile
              fields = ['nick_name', 'birday', 'gender','address','mobile']

       def clean_mobile(self):
              mobile = self.cleaned_data['mobile']
              REGEX_MOBILE = "^1[358]\d{9}$|^147\d{8}$|^176\d{8}$"
              p = re.compile(REGEX_MOBILE)
              if p.match(mobile):
                     return mobile
              else:
                     raise forms.ValidationError(u"手机号码非法", code="mobile")
