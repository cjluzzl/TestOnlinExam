# -*- coding:utf-8 -*-
__author__ = "cjluzzl"
__date__ = "2017/3/26 15:10 "
import xadmin
from xadmin import views
from .models import EmailRevifyRecord
from .models import Banner, UserProfile, UserClass, AllowedUser, FileStroe
from xadmin.plugins.auth import UserAdmin
from django.contrib.auth.models import User
from xadmin.layout import Fieldset, Main, Side, Row, FormHelper


class FileStroeAdmin(object):
    """
    file_name = models.CharField(max_length=100,verbose_name=u"文件名")
    file_content = models.FileField(verbose_name=u"文件",upload_to="file/%Y/%m/%d")
    add_time = models.DateField(default=datetime.now, verbose_name=u"发布时间")
    down_count = models.IntegerField(default=0,verbose_name=u"下载次数")
    """
    list_display = ['file_name', 'file_content', 'add_time', 'down_count']
    search_fields = ['file_name', 'file_content', 'down_count']
    list_filter = ['file_name', 'file_content', 'add_time', 'down_count']


class UserClassAdmin(object):
    list_display = ['class_name', 'count']
    search_fields = ['class_name', 'count']
    list_filter = ['class_name', 'count']

class UserProfileAdmin(UserAdmin):
    pass


#主题注册
class BaseSetting(object):
    enable_themes = True
    use_bootswatch = True


#更改网站标题和公司名注册
class GlobalSetting(object):
    site_title = u"理学院在线考试系统"
    site_footer = u"power by cjluzzl"
    menu_style = "accordion"


class EmailRevifyRecordAdmin(object):
    list_display = ['code', 'email', 'send_type', 'send_time', 'is_alive']
    search_fields = ['code', 'email', 'send_type', 'is_alive']
    list_filter = ['code', 'email', 'send_type', 'send_time', 'is_alive']


class BannerAdmin(object):
    list_display = ['title','image', 'url', 'index', 'add_time']
    search_fields = ['title','image', 'url', 'index']
    list_filter = ['title','image', 'url', 'index', 'add_time']




class AllowedUserAdmin(object):
    list_display = ['username']
    search_fields = ['username']
    list_filter = ['username']


xadmin.site.register(FileStroe, FileStroeAdmin)
#xadmin.site.unregister(User)
xadmin.site.register(AllowedUser, AllowedUserAdmin)
xadmin.site.register(UserClass, UserClassAdmin)
xadmin.site.register(EmailRevifyRecord, EmailRevifyRecordAdmin)
xadmin.site.register(Banner , BannerAdmin)
#xadmin.site.register(UserProfile , UserProfileAdmin)
xadmin.site.register(views.BaseAdminView, BaseSetting)#主题注册
xadmin.site.register(views.CommAdminView, GlobalSetting)#更改网站标题和公司名注册