#coding:utf-8
__author__ = 'mwy'
__date__ = '2017/8/20 15:16'

from django.http import HttpResponse, HttpResponseRedirect
from django.core.urlresolvers import reverse

class IPrecord(object):
    def process_request(self, requst):
        print("process_request")

    def process_view(self, request, callback, callback_args, callback_kwargs):
        print ("process_view")

    def process_exception(self, request, exception):
        print ("process wrong")
        return HttpResponseRedirect(reverse("serverError"))

    def process_response(self, request, response):
        return response
