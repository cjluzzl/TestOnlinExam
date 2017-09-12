# -*- coding:utf-8 -*-
__author__ = "cjluzzl"
__date__ = "2017/3/26 15:10 "
import xadmin
from xadmin import views
from .models import EmailRevifyRecord
from .models import Banner, UserProfile, FileStroe, ClassExcel
from xadmin.plugins.auth import UserAdmin
from django.contrib.auth.models import User
from xadmin.layout import Fieldset, Main, Side, Row, FormHelper
from xadmin.plugins.actions import BaseActionView
from django.http import HttpResponse
from TestOnlinExam.settings import BASE_DIR
import xlrd
from django.contrib.auth.hashers import make_password


def read_data_to_database(xlsfile):
    # xlsfile = "D:/Users/pyCharmPro/TestOnlinExam/utils/name.xlsx"


    book = xlrd.open_workbook(xlsfile)  # 获得excel的book对象

    # 获取sheet对象，方法有2种：
    sheet_name = book.sheet_names()[0]  # 获得指定索引的sheet名字
    print sheet_name

    sheet1 = book.sheet_by_name(sheet_name)  # 通过sheet名字来获取，当然如果你知道sheet名字了可以直接指定
    sheet0 = book.sheet_by_index(0)  # 通过sheet索引获得sheet对象

    nrows = sheet0.nrows  # 行总数
    ncols = sheet0.ncols  # 列总数
    print 'rows = ', nrows
    print 'cols = ', ncols

    for i in range(1, nrows):
        row_data = sheet1.row_values(i)
        user = UserProfile()
        user.username = str(int(row_data[0]))
        user.nick_name = row_data[1]
        user.user_class = row_data[2]
        user.email = row_data[3]
        user.password = make_password(row_data[4])
        user.save()
        print "学号:", str(int(row_data[0])), "姓名:", row_data[1], "班级:", row_data[2], "邮箱:", row_data[3], "密码:", row_data[
            4]



class MyAction(BaseActionView):
    # 这里需要填写三个属性
    action_name = "my_action"  #: 相当于这个 Action 的唯一标示, 尽量用比较针对性的名字
    description = "excel信息文件导入数据库"  # _(u'Test selected %(verbose_name_plural)s') #: 描述, 出现在 Action 菜单中, 可以使用 ``%(verbose_name_plural)s`` 代替 Model 的名字.

    model_perm = 'change'  #: 该 Action 所需权限

    # 而后实现 do_action 方法
    def do_action(self, queryset):
        # queryset 是包含了已经选择的数据的 queryset
        for obj in queryset:
            file = BASE_DIR + "/media/" + str(obj.file)
            print file
            if obj.is_add == True:
                return HttpResponse("该文件已经被添加过")
            # pass
            read_data_to_database(file)
            obj.is_add = True
            obj.save()
            # obj 的操作

        # 返回 HttpResponse
        return HttpResponse("添加成功")


class FileStroeAdmin(object):

    list_display = ['file_name', 'file_content', 'add_time', 'down_count']
    search_fields = ['file_name', 'file_content', 'down_count']
    list_filter = ['file_name', 'file_content', 'add_time', 'down_count']



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
    list_display = ['title', 'image', 'url', 'index', 'add_time']
    search_fields = ['title', 'image', 'url', 'index']
    list_filter = ['title', 'image', 'url', 'index', 'add_time']


class ClassExcelAdmin(object):
    actions = [MyAction, ]
    list_display = ['file', 'add_time', 'is_add']
    search_fields = ['file', 'is_add', 'index']
    list_filter = ['file', 'add_time', 'is_add']


xadmin.site.register(FileStroe, FileStroeAdmin)
xadmin.site.register(EmailRevifyRecord, EmailRevifyRecordAdmin)
xadmin.site.register(Banner, BannerAdmin)
xadmin.site.register(ClassExcel, ClassExcelAdmin)
xadmin.site.register(views.BaseAdminView, BaseSetting)#主题注册
xadmin.site.register(views.CommAdminView, GlobalSetting)#更改网站标题和公司名注册