# -*- coding:utf-8 -*-
from __future__ import unicode_literals

from django.db import models
from users.models import UserProfile
from coures.models import Paper, CourseList, PaperList
from datetime import datetime


class Notice(models.Model):
    pub_name = models.ForeignKey(UserProfile, verbose_name=u"发布人")
    pub_time = models.DateField(default=datetime.now, verbose_name=u"发布时间")
    pub_content = models.TextField(verbose_name=u"通知详情")

    class Meta:
        verbose_name = u"通知发布"
        verbose_name_plural = verbose_name

    def __unicode__(self):
        return self.pub_content


class UserNote(models.Model):
    user = models.ForeignKey(UserProfile, verbose_name=u"留言人")
    add_time = models.DateField(default=datetime.now, verbose_name=u"留言时间")
    note_content = models.TextField(default="", verbose_name=u"留言内容")

    class Meta:
        verbose_name = u"用户留言"
        verbose_name_plural = verbose_name

    def __unicode__(self):
        return "{0}({1})".format(self.user.nick_name,self.user.username)


class UserAnswerLog(models.Model):
    user = models.ForeignKey(UserProfile, verbose_name=u"用户")
    course = models.ForeignKey(CourseList, verbose_name=u"课程")
    paper = models.ForeignKey(Paper,verbose_name=u"试卷")
    answer = models.TextField(verbose_name=u"用户答案")
    score = models.IntegerField(verbose_name=u"得分")
    add_time = models.DateField(default=datetime.now, verbose_name=u"作答时间")

    class Meta:
        verbose_name = u"用户做题记录"
        verbose_name_plural = verbose_name

    def __unicode__(self):
        return "{0}({1}) score={2}".format(self.user.nick_name,self.user.username,self.score)


class UserScore(models.Model):
    user = models.ForeignKey(UserProfile, verbose_name=u"用户")
    paper = models.ForeignKey(PaperList, verbose_name=u"试卷")
    total = models.IntegerField(verbose_name=u"总分", default=0)
    add_time = models.DateField(verbose_name=u"录入时间",default=datetime.now)

    class Meta:
        verbose_name = u"用户总分"
        verbose_name_plural = verbose_name

    def __unicode__(self):
        return "{0}({1}) 试卷:{2} | 总分:{3}".format(self.user.nick_name, self.user.username,self.paper.paper_name,self.total)



