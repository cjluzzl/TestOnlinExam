# -*- coding:utf-8 -*-

from __future__ import unicode_literals
from django.db import models
from django.contrib.auth.models import AbstractUser
from datetime import datetime
# Create your models here.


class UserClass(models.Model):
    class_name = models.CharField(max_length=50, verbose_name=u"班级名", default=u"14信算2")
    count = models.IntegerField(default=0,verbose_name=u"班级总人数")

    class Meta:
        ordering = ["class_name"]
        verbose_name = u"班级信息"
        verbose_name_plural = verbose_name

    def __unicode__(self):
        return self.class_name


class UserProfile(AbstractUser):
    nick_name = models.CharField(max_length=50, verbose_name=u"姓名", default= "")
    birthday = models.DateField(verbose_name=u"生日", null=True, blank=True)
    # user_classname = models.ForeignKey(UserClass,verbose_name=u"班级名",default=1)
    gender = models.CharField(max_length=6, choices=(('male', u"男"), ('female', u"女")), default="female")
    mobile = models.CharField(max_length=11, null=True, blank=True)
    image = models.ImageField(upload_to="static/images/head/%Y/%m", default="static/images/head/default.png", max_length=100)

    class Meta:
        verbose_name = u"用户信息"
        verbose_name_plural = verbose_name

    def __unicode__(self):
        return self.username


class EmailRevifyRecord(models.Model):
    code = models.CharField(max_length=20, verbose_name=u"验证码")
    email = models.EmailField(max_length=50, verbose_name=u"邮箱")
    is_alive = models.BooleanField(default=False,verbose_name=u"是否可用")
    send_type = models.CharField(verbose_name=u"验证码类型",choices=(("register", u"注册"), ("forget", u"找回密码")), max_length=10)
    send_time = models.DateField(verbose_name=u"发送时间",default=datetime.now)

    class Meta:
        verbose_name = u"邮箱验证码"
        verbose_name_plural = verbose_name

    def __unicode__(self):
        return '{0}({1})'.format(self.code, self.email);


class Banner(models.Model):
    title = models.CharField(max_length=100, verbose_name=u"标题")
    image = models.ImageField(upload_to="static/images/banner/%Y/%m", verbose_name=u"轮播图", max_length=100)
    url = models.URLField(max_length=200, verbose_name=u"访问地址")
    index = models.IntegerField(default=100, verbose_name=u"顺序")
    add_time = models.DateField(default=datetime.now, verbose_name=u"添加时间")

    class Meta:
        verbose_name = u"轮播图"
        verbose_name_plural = verbose_name


class ClassExcel(models.Model):
    file = models.FileField(verbose_name=u"文件名", upload_to="file/class_excle")
    add_time = models.DateField(default=datetime.now, verbose_name=u"添加时间")
    is_add = models.BooleanField(default=False, verbose_name=u"是否被导入数据库")

    class Meta:
        verbose_name = u"导入学生信息文件"
        verbose_name_plural = verbose_name


class FileStroe(models.Model):
    file_name = models.CharField(max_length=100, verbose_name=u"文件名")
    file_content = models.FileField(verbose_name=u"文件", upload_to="file/%Y/%m/%d")
    add_time = models.DateField(default=datetime.now, verbose_name=u"发布时间")
    down_count = models.IntegerField(default=0, verbose_name=u"下载次数")

    class Meta:
        verbose_name = u"资料下载管理"
        verbose_name_plural = verbose_name
