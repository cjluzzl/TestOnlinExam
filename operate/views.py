# -*- coding:utf-8 -*-

from django.shortcuts import render
from django.contrib.auth import authenticate,login
from django.contrib.auth.backends import ModelBackend
from users.models import UserProfile
from django.db.models import Q #支持后面的并集查询
from django.views.generic.base import View
from django.contrib.auth.hashers import make_password
from .forms import QuestionFormChoice, QuestionFormJD, QuestionFormJudge
from coures.models import Paper, Question, CourseList, PaperList
from .models import UserAnswerLog, UserScore, UserNote
from datetime import datetime
from users.models import FileStroe


class PaperListView(View):
    """试题列表页面"""

    def get(self, request):
        papers = PaperList.objects.filter(is_allow=True)
        for i in papers:
            print i.name, '**', i.id
        return render(request, "paper_list.html", {"papers": papers, "title": u"试题列表页面"})


class PaperView(View):
    def get(self, request, paper_id):
        if request.user.is_authenticated():
            paper_list_id = PaperList.objects.filter(id=paper_id)#找到目标试卷
            papers = Paper.objects.filter(paper_name__id=paper_list_id)#找到所有试题
            question_list = []
            question_id_list = []
            for paper in papers:
                print 'paper is ', paper
                question = Question.objects.get(pk=paper.question_id)
                question_list.append(question)

                question_id_list.append(question.id)
                #print question_id_list 获取该套试题的所有题目编号列表

            title = paper.paper_name

            print 'get 方法里用户获取的题目编号为', question_id_list  # 显示当前题目编号列表
            question_now = tuple(question_list)  # 题目元组

            question_count = len(question_now)  # 题目数
            return render(request, "paper_question.html", {"question": question_now,
                                                           "question_count": question_count, "title": title})
        else:
            return render(request, "login.html", {"msg": u'为保证考试客观公正，考题不对未登录用户开放'})

    def post(self, request, paper_id):
        if request.user.is_authenticated():
            paper_list_id = PaperList.objects.filter(id=paper_id)  # 找到目标试卷
            papers = Paper.objects.filter(paper_name__id=paper_list_id)  # 找到所有试题
            question_id_list = []
            for paper in papers:
                print 'paper is ', paper
                question = Question.objects.get(pk=paper.question_id)
                question_id_list.append(question.id)
            # 找到该用户所有的做题记录
            all_score = UserScore.objects.filter(user=request.user)

            title = paper.paper_name.name
            # 分数记录
            user_score = UserScore()
            # 记录用户
            user_score.user = request.user
            # 记录试卷名
            user_score.paper = PaperList.objects.get(pk=paper_id)
            # 记录做题时间
            user_score.add_time = datetime.now()
            # 显示提交的题目编号列表
            print 'post 方法里用户获取的题目编号为', question_id_list
            temp_score = 0
            # 遍历每一道题
            for i in question_id_list:
                # 根据编号找到用户提交的对应题号的答案
                user_ans = request.POST.get(str(i), "")
                print u'试题', i, u'收到的答案是', user_ans
                # 获取题号为 i 的题目元组对象
                temp_question = Question.objects.get(pk=i)
                # 把正确答案与提交的答案比较
                if temp_question.answer == user_ans:
                    temp_score += temp_question.score
                    print "试题", temp_question.id, "答案正确"
            state = 0
            user_score.total = temp_score
            for i in all_score:
                if i.paper.pk == int(paper_id):
                    state = 1
                    if temp_score > i.total:
                        i.total = temp_score
                        i.save()
                        return render(request, "score.html", {"score": user_score.total, "title": title})
                    else:
                        return render(request, "score.html", {"score": user_score.total, "title": title})
            if state == 0:
                user_score.save()
            return render(request, "score.html", {"score": user_score.total, "title": title})


class DownloadFunView(View):
    def get(self, request, page_number):
        file_list = FileStroe.objects.all()
        return render(request, "download.html", {"file_list": file_list})


class DownAddView(View):
    def post(self, request):
        file_list = FileStroe.objects.all()
        file_id = request.POST.get("file_id")
        print "asdfsasdfasdf", file_id
        file = FileStroe.objects.get(pk=file_id)
        file.down_count += 1
        file.save()
        return render(request, "download.html", {"file_list": file_list})
