#coding:utf-8
from django.shortcuts import render
from django.views.generic.base import View
from django.http import HttpResponse
from django.db.models import Q
from pure_pagination import Paginator, EmptyPage, PageNotAnInteger
import json

from .models import Course
from operation.models import UserFavourate, CourseComments, UserCourse
from courses.models import Video
from utils.mixin_utils import LoginRequiredMixin


class CourseListView(View):
    def get(self, request):
        all_course = Course.objects.all()
        keywords = request.GET.get('keywords', "")
        if keywords:
            all_course = all_course.filter(Q(name__icontains=keywords)|
                                           Q(desc__icontains=keywords) |
                                           Q(detail__icontains=keywords))

        sort = request.GET.get('sort', "")
        if sort == 'hot':
            all_course = all_course.order_by("-%s" % "favour_nums")
        elif sort == 'students':
            all_course = all_course.order_by("-%s" % "students")
        else:
            all_course = all_course.order_by("-add_time")
        course_nums = all_course.count()
        hot_course = all_course.order_by("-favour_nums")[:3]
        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1
        p = Paginator(all_course, 6, request=request)
        courses = p.page(page)
        category = "course"
        return render(request, "course-list.html", {
            "all_course": courses,
            "hot_course": hot_course,
            "course_nums":course_nums,
            "sort": sort,
            "category":category
        })

class CourseDetailView(View):
    def get(self, request,course_id):
        course = Course.objects.get(id=int(course_id))
        course.click_num += 1
        course.save()
        isCouseFav = isOrgFav = False
        org = course.course_org
        if request.user.is_authenticated():
            if UserFavourate.objects.filter(user=request.user, fav_id=course_id, fav_type=1):
                isCouseFav = True

            if UserFavourate.objects.filter(user=request.user, fav_id=org.id, fav_type=2):
                isOrgFav = True
        teacher_num = org.teacher_set.count()
        return render(request, "course-detail.html", {
            "course":course,
            "isCouseFav":isCouseFav,
            "isOrgFav":isOrgFav,
            "org":org,
            "teacher_num":teacher_num

        })


class CourseLessonView(LoginRequiredMixin, View):
    def get(self, request, course_id):
        course = Course.objects.get(id=int(course_id))
        course.students+=1
        course.save()
        user_course = UserCourse.objects.filter(user=request.user, course=course)
        if not user_course:
            UserCourse(user=request.user, course=course).save()
        # 学过该课程的学生还学了
        # 学这门课的学生
        releated_UserCourse = UserCourse.objects.filter(course=course)
        releated_users = [item.user for item in releated_UserCourse]
        print ([item.username for item in releated_users])
        # 这些学生学过的课
        releated_UserCourse = UserCourse.objects.filter(user__in=releated_users)
        releated_courses = [item.course for item in releated_UserCourse]
        releated_courses = [item.id for item in releated_courses]
        releated_courses = Course.objects.filter(id__in=releated_courses).order_by("-click_num")
        return render(request, "course-video.html", {
            "course":course,
            "releated_courses":releated_courses
        })


class CourseCommentsView(View):
    def get(self, request, course_id):
        course = Course.objects.get(id=int(course_id))
        all_comments = course.coursecomments_set.all().order_by("-add_time")

        return render(request, "course-comment.html",{
            "course": course,
            "comments":all_comments
        })

    def post(self, request):
        if not request.user.is_authenticated():
            restr = {'status': 'fail', 'msg': '用户未登录'}
            restr = json.dumps(restr)
            return HttpResponse(restr, content_type='application/json')
        course_id = int(request.POST.get("course_id", "-1"))
        comments = request.POST.get("comments", "")
        course = Course.objects.filter(id=int(course_id))
        if comments == "":
            restr = {'status': 'fail', 'msg': '评论不能为空'}
            restr = json.dumps(restr)
            return HttpResponse(restr, content_type='application/json')
        if course:
            coures_comment = CourseComments()
            coures_comment.course = course[0]
            coures_comment.comments = comments
            coures_comment.user = request.user
            coures_comment.save()
            restr = {'status': 'success'}
            restr = json.dumps(restr)
            return HttpResponse(restr, content_type='application/json')
        else:
            restr = {'status': 'fail','msg':'课程不存在'}
            restr = json.dumps(restr)
            return HttpResponse(restr, content_type='application/json')


class VideoPlayView(View):
    """
    视频播放页面
    """
    def get(self, request, video_id):
        video = Video.objects.get(id=int(video_id))
        course = video.lesson.course
        user_course = UserCourse.objects.filter(user=request.user, course=course)
        if not user_course:
            UserCourse(user=request.user, course=course).save()
        # 学过该课程的学生还学了
        # 学这门课的学生
        releated_UserCourse = UserCourse.objects.filter(course=course)
        releated_users = [item.user for item in releated_UserCourse]
        # 这些学生学过的课
        releated_UserCourse = UserCourse.objects.filter(user__in=releated_users)
        releated_courses = [item.course for item in releated_UserCourse]
        releated_courses = [item.id for item in releated_courses]
        releated_courses = Course.objects.filter(id__in=releated_courses).order_by("-click_num")
        return render(request, "course-play.html", {
            "course":course,
            "releated_courses":releated_courses,
            "video":video
        })




