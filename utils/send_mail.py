# -*- coding:utf-8 -*-
__author__ = "cjluzzl"
__date__ = "2017/3/26 15:06 "

from random import Random
from users.models import EmailRevifyRecord
from django.core.mail import send_mail
from TestOnlinExam.settings import EMAIL_FROM


def random_str(randomlength=8):
    str1 = '';
    chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxZz0123456789';
    length = len(chars) - 1;
    random = Random();
    for i in range(randomlength):
        str1 += chars[random.randint(0, length)];
    return str1;


def send_register_email(email, send_type="register"):
    email_record = EmailRevifyRecord()
    code = random_str(16)
    email_record.code = code
    email_record.email = email
    email_record.send_type = send_type
    email_record.is_alive = True
    email_record.save()

    email_title = ""
    email_body = ""
    if send_type == "register":
        email_title = "注册激活链接"
        email_body = "请点击下边的链接激活你的账号 https://exam.cjluzzl.cn/active/{0}".format(code)
        send_status = send_mail(email_title, email_body, EMAIL_FROM, [email])
        if send_status:
            pass

    elif send_type == "forget":
        email_title = "找回密码链接"
        email_body = "请点击下边的链接找回你的密码 https://exam.cjluzzl.cn/reset/{0}".format(code)
        send_status = send_mail(email_title, email_body, EMAIL_FROM, [email])
        if send_status:
            pass
