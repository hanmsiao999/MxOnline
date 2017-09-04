#coding:utf-8
__author__ = 'mwy'
__date__ = '2017/8/1 19:05'

from django.core.mail import send_mail

from random import Random

from users.models import  EmailVerifyRecord
from MxOnline.settings import EMAIL_FROM

def random_str(randomlength=8):
    str = ''
    chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"
    length = len(chars) - 1
    random = Random()
    for i in range(randomlength):
        str+=chars[random.randint(0, length)]
    return str

def send_register_email(email, send_type='register'):
    email_record = EmailVerifyRecord()
    if send_type == 'change_email':
        email_record.code = random_str(4)
    else:
        email_record.code = random_str(16)
    email_record.email = email
    email_record.send_type = send_type
    email_record.save()

    email_title = ""
    email_body = ""

    if send_type == 'register':
        email_title = '慕学在线——注册激活连接'
        email_body = '请点击下方链接注册帐号:http://127.0.0.1:8000/active/{0}'.format(email_record.code)
        send_status = send_mail(email_title, email_body, EMAIL_FROM,[email_record.email])
        if send_status:
            pass
    elif send_type == 'forget':
        email_title = '慕学在线——密码重置链接'
        email_body = '请点击下方链接重置密码:http://127.0.0.1:8000/reset/{0}'.format(email_record.code)
        send_status = send_mail(email_title, email_body, EMAIL_FROM, [email_record.email])
        if send_status:
            pass
    elif send_type == 'change_email':

        email_title = "慕学在线——邮箱重置链接"
        email_body = '重置邮箱验证码为{0}'.format(email_record.code)
        send_status = send_mail(email_title, email_body, EMAIL_FROM, [email_record.email])
        return send_status






