# -*- coding:utf-8 -*-
__author__ = "cjluzzl"
__date__ = "2017/3/26 16:19 "
import xadmin
from xadmin import views
from .models import Notice, UserNote, UserAnswerLog, UserScore


class NoticeAdmin(object):
    list_display = ['pub_name', 'pub_content', 'pub_time']
    search_fields = ['pub_name__username', 'pub_name__nick_name', 'pub_content']
    list_filter = ['pub_name', 'pub_content', 'pub_time']


class UserNoteAdmin(object):
    list_display = ['user', 'note_content', 'add_time']
    search_fields = ['user__nick_name', 'user__username', 'note_content', 'add_time']
    list_filter = ['user', 'note_content', 'add_time']


class UserAnswerLogAdmin(object):
    list_display = ['user', 'paper', 'answer','score', 'add_time']
    search_fields = ['user__nick_name', 'user__username', 'paper__paper_name', 'answer', 'score']
    list_filter = ['user', 'paper', 'answer', 'score', 'add_time']


class UserScoreAdmin(object):
    list_display = ['user', 'paper', 'total', 'add_time']
    search_fields = ['user__nick_name', 'user__username', 'paper__paper_name', 'total']
    list_filter = ['user', 'paper', 'total','add_time']


xadmin.site.register(Notice, NoticeAdmin)
xadmin.site.register(UserNote, UserNoteAdmin)
xadmin.site.register(UserAnswerLog, UserAnswerLogAdmin)
xadmin.site.register(UserScore, UserScoreAdmin)