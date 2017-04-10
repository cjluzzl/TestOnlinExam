# -*- coding:utf-8 -*-

from django.shortcuts import render
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.backends import ModelBackend
from .models import UserProfile, EmailRevifyRecord, AllowedUser
from django.db.models import Q #支持后面的并集查询
from django.views.generic.base import View
from .forms import LoginForm, RegisterForm, ForgetForm, ModifyPwdForm, UserInfoForm
from django.contrib.auth.hashers import make_password
from utils.send_mail import send_register_email

title = "中国计量大学理学院在线考试系统"
phoneNumber = "15068895421"


#调试完成
class CustomBackend(ModelBackend):
    """
    #使用自定义邮箱登陆
    到settings中配置
    AUTHENTICATION_BACKENDS =(
    'users.views.CustomBackend',#元组中只有一个元素要加逗号！！！！
    )
    """
    def authenticate(self, username=None, password=None, **kwargs):
        try:
            user = UserProfile.objects.get(Q(username=username)|Q(email=username))
            if user.check_password(password):
                return user
        except Exception as e:
            return None



class RegisterView(View):
    """注册模块,调试完成"""
    def get(self, request):
        register_form = RegisterForm()
        return render(request, "register.html", {"register_form": register_form, "title": title})

    def post(self, request):
        register_form = RegisterForm(request.POST)
        if register_form.is_valid():
            user_email = request.POST.get("email", "")
            user_name = request.POST.get("username", "")

            if UserProfile.objects.filter(username=user_name):
                return render(request, "register.html",
                              {"title": title,"register_form": register_form, "msg": u"该学号已经被注册"});

            if UserProfile.objects.filter(email=user_email):
                return render(request, "register.html",
                              {"title": title,"register_form": register_form, "msg": u"该邮箱已经被注册"});

            user_password = request.POST.get("password", "")
            user_profile = UserProfile()
            user_profile.username = user_name
            user_profile.email = user_email
            user_profile.is_active = False
            user_profile.password = make_password(user_password)
            user_profile.save()
            send_register_email(user_email, "register")
            return render(request, "register.html", {"title": title,"msg":u"请登陆注册邮箱查收激活邮件"})
        else:
            return render(request, "register.html",{"register_form":register_form, "title": title})


#调试完成
class ActiveUserView(View):
    def get(self, request, active_code):
        all_code = EmailRevifyRecord.objects.filter(code=active_code)
        if all_code:
            for record in all_code:
                if record.is_alive:
                    email = record.email
                    user = UserProfile.objects.get(email=email)
                    username = user.username
                    user.is_active = True #激活用户
                    record.is_alive = False #设置当前验证码失效
                    user.save()
                    return render(request, "active_succcess.html", {"title": title, "username": username})
            return render(request, "active_fail.html", {"title": title})
        else:
            return render(request, "active_fail.html", {"title": title})


#调试完成
class LoginView(View):
    def get(self, request):
        login_form = LoginForm()
        return render(request, "login.html", {"login_form":login_form, "title": title, "phoneNumber": phoneNumber})

    def post(self, request):
        login_form = LoginForm(request.POST)
        if login_form.is_valid():#验证表是否为空
            user_name = request.POST.get("username", "")
            user_password = request.POST.get("password", "")
            user = authenticate(username=user_name, password=user_password)
            if user is not None:
                if user.is_active:
                    login(request, user)
                    return render(request, "index.html", {"msg": "用户名或密码错误",})
                else:
                    return render(request, "login.html", {"msg": "用户名或密码错误", })
        else:
            return render(request, "login.html", {"login_form": login_form})


class LogoutView(View):
    def get(self, request):
        logout(request)
        return render(request, "login.html", {"msg":u"您已经成功退出登录状态", })


#调试完成
class ForgetPwdView(View):
    def get(self, request):
        forget_form = ForgetForm()
        return render(request, "forgetpwd.html", {"forget_form": forget_form, "title": title, "phoneNumber": phoneNumber})

    def post(self, request):
        forget_form = ForgetForm(request.POST)
        if forget_form.is_valid():
            email = request.POST.get("email","")
            send_register_email(email,send_type="forget")
            return render(request, "send_success.html", {"email":email, "title": title, "phoneNumber": phoneNumber})
        else:
            return render(request, "forgetpwd.html",
                          {"forget_form": forget_form, "title": title, "phoneNumber": phoneNumber})


#调试完成
class ResetView(View):
    def get(self, request, active_code):
        all_code = EmailRevifyRecord.objects.filter(code=active_code)
        if all_code:
            for record in all_code:
                if record.is_alive:
                    email = record.email
                    record.is_alive = False
                    return render(request, "password_reset.html", {"email": email})

            return render(request, "active_fail.html")
        else:
            return render(request, "active_fail.html")


#调试完成
class ModifyPwdView(View):
    def post(self, request):
        modify_form = ModifyPwdForm(request.POST)
        if modify_form.is_valid():
            pwd1 = request.POST.get("password1", "")
            pwd2 = request.POST.get("password2", "")
            email = request.POST.get("email", "")
            if pwd1 != pwd2:
                return render(request, "password_reset.html", {"email": email, "msg": "两次输入的密码不相同"})
                pass
            user = UserProfile.objects.get(email=email)
            user.password = make_password(password=pwd1)
            user.save()
            return render(request, "modify_success.html",{"msg":"密码修改成功"})
        else:
            email = request.POST.get("email", "")
            return render(request, "password_reset.html", {"email": email, "modify_form": ""})


#用户中心
class UserCenterView(View):
    def get(self, request):
        user = request.user
        user_form = UserInfoForm()
        user_form.nick_name = user.nick_name
        user_form.birthday = user.birthday
        user_form.gender = user.gender
        user_form.mobile = user.mobile
        print user.nick_name
        print user.birthday
        print user.gender
        print user.mobile
        return render(request, "usercenter-info.html",
                      {"user_form": user_form, "title": title, "phoneNumber": phoneNumber})


#404调试完成
def page_not_found(request):
    # 全局404处理函数
    from django.shortcuts import render_to_response
    response = render_to_response('404.html', {"title": title})
    response.status_code = 404
    return response


#500调试完成
def page_error(request):
    # 全局500处理函数
    from django.shortcuts import render_to_response
    response=render_to_response('500.html', {"title":title});
    response.status_code=500;
    return response;