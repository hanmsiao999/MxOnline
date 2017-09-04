#coding:utf-8
__author__ = 'mwy'
__date__ = '2017/8/9 8:31'

from django.contrib.auth.decorators import  login_required
from django.utils.decorators import method_decorator

class LoginRequiredMixin(object):
    @method_decorator(login_required(login_url="/login/"))
    def dispatch(self, request, *args, **kwargs):
        return super(LoginRequiredMixin, self).dispatch(request, *args, **kwargs)