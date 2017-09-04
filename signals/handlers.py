#coding:utf-8
__author__ = 'mwy'
__date__ = '2017/8/19 11:45'

from django.dispatch import receiver
from django.core.signals import request_finished

@receiver(request_finished, dispatch_uid="request_finished")
def my_signal_handler(sender, **kwargs):
    print("Request finished!================================")