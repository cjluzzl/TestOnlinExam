# -*- coding:utf-8 -*-
"""TestOnlinExam URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.9/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Add an import:  from blog import urls as blog_urls
    2. Import the include() function: from django.conf.urls import url, include
    3. Add a URL to urlpatterns:  url(r'^blog/', include(blog_urls))
"""
from django.conf.urls import url,include
from django.contrib import admin
from django.views.generic import TemplateView
from django.views.static import serve
import xadmin
from users.views import LoginView, LogoutView, RegisterView, ActiveUserView, \
    ForgetPwdView, ResetView, ModifyPwdView, UserCenterView
from operate.views import PaperView, PaperListView, DownloadFunView, DownAddView
from TestOnlinExam.settings import MEDIA_ROOT, STATIC_ROOT, STATIC_URL
from django.conf.urls.static import static
from users.views import index, echo_once


urlpatterns = [
    url(r'^xadmin/', xadmin.site.urls),
    url(r'^$', TemplateView.as_view(template_name="index.html"),name="index"),
    url(r'^login/$', LoginView.as_view(), name="login"),
    url(r'^logout/$',LogoutView.as_view(), name="logout"),
    url(r'^register/$', RegisterView.as_view(), name="register"),
    url(r'^captcha/', include('captcha.urls')),
    url(r'^active/(?P<active_code>.*)/$', ActiveUserView.as_view(), name="user_active"),
    url(r'^forget/$', ForgetPwdView.as_view(), name="forget_pwd"),
    url(r'^reset/(?P<active_code>.*)/$', ResetView.as_view(), name="reset_pwd"),
    url(r'^modify_pwd/$', ModifyPwdView.as_view(), name="modify_pwd"),
    url(r'^user_center/$', UserCenterView.as_view(), name="user_center"),
    url(r'^paper/(?P<paper_id>.*)/$', PaperView.as_view(), name="paper"),
    url(r'^paperlist/$', PaperListView.as_view(), name="paper_list"),
    # 配置媒体文件显示的view
    url(r'^media/(?P<path>.*)$', serve, {"document_root": MEDIA_ROOT}),
    url(r'download_info/(?P<page_number>.*)$', DownloadFunView.as_view(), name="download"),
    url(r'downadd/$', DownAddView.as_view(), name="downadd"),
    url(r'^static/(?P<path>.*)$', 'django.views.static.serve', {'document_root': STATIC_ROOT}),

    url(r'^index/', index),
    url(r'^echo_once/', echo_once),
]  # + static(STATIC_URL, document_root=STATIC_ROOT)

# 全局404页面配置
handler404 = 'users.views.page_not_found'
# 全局500页面配置
handler500 = 'users.views.page_error'
