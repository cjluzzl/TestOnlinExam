# -*- coding:utf-8 -*-
__author__ = "cjluzzl"
__date__ = "2017/3/28 17:37 "

from django import forms
from captcha.fields import CaptchaField


class QuestionFormChoice(forms.Form):
    id = forms.IntegerField()
    course_id = forms.IntegerField()
    choice = forms.ChoiceField()#选项
    note = forms.Textarea()#备注


class QuestionFormJudge(forms.Form):
    id = forms.IntegerField()
    course_id = forms.IntegerField()
    choice_bf = forms.BooleanField()
    note = forms.Textarea()


class QuestionFormJD(forms.Form):
    id = forms.IntegerField()
    course_id = forms.IntegerField()
    note = forms.Textarea()