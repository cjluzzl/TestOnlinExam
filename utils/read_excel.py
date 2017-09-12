# -*- coding:utf-8 -*-
__author__ = "cjluzzl"
__date__ = "2017/9/11 22:56 "

# import xlrd
# import os, django
#
# os.environ.setdefault("DJANGO_SETTINGS_MODULE", "TestOnlinExam.settings")  # project_name 项目名称
# django.setup()
# from users.models import UserProfile
#
# from django.contrib.auth.hashers import make_password
#
#
# def read_data_to_database(xlsfile):
#     # xlsfile = "D:/Users/pyCharmPro/TestOnlinExam/utils/name.xlsx"
#
#
#     book = xlrd.open_workbook(xlsfile)  # 获得excel的book对象
#
#     # 获取sheet对象，方法有2种：
#     sheet_name = book.sheet_names()[0]  # 获得指定索引的sheet名字
#     print sheet_name
#
#     sheet1 = book.sheet_by_name(sheet_name)  # 通过sheet名字来获取，当然如果你知道sheet名字了可以直接指定
#     sheet0 = book.sheet_by_index(0)  # 通过sheet索引获得sheet对象
#
#     nrows = sheet0.nrows  # 行总数
#     ncols = sheet0.ncols  # 列总数
#     print 'rows = ', nrows
#     print 'cols = ', ncols
#
#     for i in range(1, nrows):
#         row_data = sheet1.row_values(i)
#         user = UserProfile()
#         user.username = str(int(row_data[0]))
#         user.nick_name = row_data[1]
#         user.email = row_data[3]
#         user.password = make_password(row_data[4])
#         user.save()
#         print "学号:", str(int(row_data[0])), "姓名:", row_data[1], "班级:", row_data[2], "邮箱:", row_data[3], "密码:", row_data[4]
