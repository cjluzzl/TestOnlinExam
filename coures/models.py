# -*- coding:utf-8 -*-

from __future__ import unicode_literals

from django.db import models
from datetime import datetime
# Create your models here.


class CourseList(models.Model):
    name = models.CharField(max_length=100, verbose_name=u"课程名", default="")
    decs = models.CharField(max_length=500, verbose_name=u"课程说明", default="")
    add_time = models.DateField(default=datetime.now, verbose_name=u"添加时间")

    class Meta:
        verbose_name = u"课程"
        verbose_name_plural = verbose_name

    def __unicode__(self):
        return self.name


class Question(models.Model):
    course = models.ForeignKey(CourseList, verbose_name=u"课程")
    questionType = models.CharField(max_length=2, choices=(("xz", u"选择题"), ("pd", u"判断题"), ("zg", u"问答")), default="xz", verbose_name=u"题目类型")
    content = models.TextField(verbose_name=u"题目内容")
    answer = models.TextField(verbose_name=u"正确答案")
    choice_a = models.TextField(verbose_name=u"A选项", default="A.")
    choice_b = models.TextField(verbose_name=u"B选项", default="B.")
    choice_c = models.TextField(verbose_name=u"C选项", default="C.")
    choice_d = models.TextField(verbose_name=u"D选项", default="D.")
    score = models.IntegerField(verbose_name=u"分值", default=0)
    note = models.TextField(verbose_name=u"备注信息", default= u"问答题在此处做答")
    boolt = models.TextField(verbose_name=u"判断正误正确选项", default= "True")
    boolf = models.TextField(verbose_name=u"判断正误错误选项", default= "False")
    add_time = models.DateField(default=datetime.now, verbose_name=u"添加时间")

    class Meta:
        verbose_name = u"题库"
        verbose_name_plural = verbose_name

    def get_content_display(self, field):
        return self.content

    def __unicode__(self):
        model = Question
        return "{0}(题干:{1} | 正确答案:{2} )".format(self.course.name, self.content, self.answer)


class PaperList(models.Model):
    course = models.ForeignKey(CourseList, verbose_name=u"所属课程")
    name = models.CharField(max_length=100, verbose_name=u"试卷名", default=u"")
    is_allow = models.BooleanField(default=False, verbose_name=u"是否启用")
    add_time = models.DateField(default=datetime.now, verbose_name=u"添加时间")

    class Meta:
        verbose_name = u"试卷列表"
        verbose_name_plural = verbose_name

    def __unicode__(self):
        return u"{0}(试卷名称:{1} | 使用状态:{2})".format(self.course.name, self.name, self.is_allow)


class Paper(models.Model):
    course = models.ForeignKey(CourseList, verbose_name=u"所属课程", default=1)
    question = models.ForeignKey(Question, verbose_name=u"题目")
    paper_name = models.ForeignKey(PaperList, verbose_name=u"试卷名称")
    add_time = models.DateField(default=datetime.now, verbose_name=u"添加时间")

    class Meta:
        verbose_name = u"试题列表"
        verbose_name_plural = verbose_name

    def __unicode__(self):
        return u"{0} ({1})".format(self.paper_name, self.question.content)

#
# class Down_info(models.Model):
#     #资料下载页面
#     name = models.CharField(verbose_name=u"资料名", default=u"资料", max_length=100)
#     add_time = models.DateField(verbose_name=u"添加时间", default = datetime.now)
#     file = models.FileField(verbose_name=u"文件")
