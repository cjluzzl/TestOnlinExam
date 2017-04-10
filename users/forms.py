# -*- coding:utf-8 -*-
__author__ = "cjluzzl"
__date__ = "2017/3/26 15:12 "

from django import forms
from captcha.fields import CaptchaField


class LoginForm(forms.Form):
    #与前台表格的name相同
    username = forms.CharField(required=True)
    password = forms.CharField(required=True, min_length=5)
    captcha = CaptchaField(error_messages={"invalid": u"验证码错误"})


class RegisterForm(forms.Form):
    username = forms.IntegerField(min_value=1000000000, max_value=9999999999)
    email = forms.EmailField(required=True)
    password = forms.CharField(required=True, min_length=5)
    captcha = CaptchaField(error_messages={"invalid": u"验证码错误"})


class ForgetForm(forms.Form):
    username = forms.IntegerField(min_value=1000000000, max_value=9999999999)
    email = forms.EmailField(required=True)
    captcha = CaptchaField(error_messages={"invalid": u"验证码错误"})


class ModifyPwdForm(forms.Form):
    password1 = forms.CharField(required=True, min_length=5)
    password2 = forms.CharField(required=True, min_length=5)


class UserInfoForm(forms.Form):
    nick_name = forms.CharField(required=True, max_length=20)
    birthday = forms.DateField(required=True)
    gender = forms.ChoiceField(choices=(("male", u"男"), ("female", u"女")), required=True)
    address = forms.CharField(required=True, max_length=50)
    mobile = forms.CharField(required=True,max_length=11)
