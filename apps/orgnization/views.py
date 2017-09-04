#coding:utf-8

from django.shortcuts import render
from django.views.generic.base import View
from django.http import HttpResponse
from django.db.models import Q
from pure_pagination import Paginator, EmptyPage, PageNotAnInteger


from .models import CourseOrg, CityDict, Teacher
from courses.models import Course
from operation.models import UserFavourate
from .forms import UserAskForm
import json
# Create your views here.

class OrgView(View):

      def get(self, request):
          all_orgs = CourseOrg.objects.all()
          hot_orgs = all_orgs.order_by("-click_num")[:3]
          keywords = request.GET.get('keywords', "")
          if keywords:
              all_orgs = all_orgs.filter(Q(name__icontains=keywords) |
                                             Q(dec__icontains=keywords))

          # 取出筛选城市
          city_id = request.GET.get('city', "")
          if city_id:
              all_orgs = all_orgs.filter(city_id=city_id)
          # 取出筛选机构类别
          category = request.GET.get('ct', "")
          if category:
              all_orgs = all_orgs.filter(category=category)

          sort = request.GET.get('sort','')
          if sort == 'students':
              all_orgs = all_orgs.order_by("-students_num")
          elif sort == 'courses':
              all_orgs = all_orgs.order_by("-courses_num")

          all_cities = CityDict.objects.all()
          # 对课程机构进行分页
          try:
              page = request.GET.get('page', 1)
          except PageNotAnInteger:
              page = 1
          p = Paginator(all_orgs,3, request=request)
          orgs = p.page(page)
          org_nums = all_orgs.count()
          category = "org"
          return render(request, "org-list.html",{
              "all_orgs":orgs,
              "all_cities":all_cities,
              "org_nums":org_nums,
              "city_id":city_id,
              "category":category,
              "hot_orgs":hot_orgs,
              "sort":sort,
              "category":category
          })


class AddUserAskView(View):
    """
    用户添加咨询
    """
    def post(self, request):
        userask_form = UserAskForm(request.POST)
        if userask_form.is_valid():
            # ModelForm 可以直接Save
            user_ask = userask_form.save(commit=True)
            restr = {'status': 'success'}
            restr = json.dumps(restr)
            return HttpResponse(restr, content_type='application/json')
        else:
            restr = {'status':'fail','msg':'添加出错'}
            restr = json.dumps(restr)
            return HttpResponse(restr, content_type='application/json')


class OrgHomeView(View):
    """
    机构首页
    """
    def get(self, request, org_id):

        course_org = CourseOrg.objects.get(id=int(org_id))
        course_org.click_num+=1
        course_org.save()
        has_fav = False
        if request.user.is_authenticated():
            if UserFavourate.objects.filter(user=request.user,fav_id=org_id,fav_type=2):
                has_fav = True
        all_courses = course_org.course_set.all()[:3] # 多对一 一之反向查找
        all_teachers = course_org.teacher_set.all()[:1]
        return render(request, 'org-detail-homepage.html',{
            'all_courses':all_courses,
            'all_teachers':all_teachers,
            'course_org':course_org,
            'current_page':'home',
            'has_fav':has_fav

        })


class OrgCourseView(View):
    """
    机构课程列表页
    """
    def get(self, request, org_id):
        course_org = CourseOrg.objects.get(id=int(org_id))
        has_fav = False
        if request.user.is_authenticated():
            if UserFavourate.objects.filter(user=request.user, fav_id=org_id, fav_type=2):
                has_fav = True
        all_courses = course_org.course_set.all()  # 多对一 一之反向查找
        return render(request, 'org-detail-course.html', {
            'all_courses': all_courses,
            'course_org': course_org,
            'current_page': 'course',
            'has_fav': has_fav
        })


class OrgIntroductionView(View):

    def get(self, request, org_id):
        course_org = CourseOrg.objects.get(id=int(org_id))
        has_fav = False
        if request.user.is_authenticated():
            if UserFavourate.objects.filter(user=request.user, fav_id=org_id, fav_type=2):
                has_fav = True
        return render(request, 'org-detail-desc.html',{
            'course_org': course_org,
            'current_page':'Introduction',
            'has_fav': has_fav
        })


class OrgTeacherView(View):
    def get(self, request, org_id):
        course_org = CourseOrg.objects.get(id=int(org_id))
        has_fav = False
        if request.user.is_authenticated():
            if UserFavourate.objects.filter(user=request.user, fav_id=org_id, fav_type=2):
                has_fav = True
        all_teachers = course_org.teacher_set.all()
        return render(request, 'org-detail-teachers.html',{
            'org_teachers': all_teachers,
            'current_page':'teacher',
            'course_org': course_org,
            'has_fav':has_fav
        })


class AddFavView(View):
    """
    用户收藏
    """
    def post(self, request):
        fav_id = int(request.POST.get("fav_id","-1"))
        fav_type = int(request.POST.get("fav_type","-1"))

        if not request.user.is_authenticated():
            # 判断用户是否登录
            restr = {'status': 'fail','msg':'用户未登录'}
            restr = json.dumps(restr)
            return HttpResponse(restr, content_type='application/json')
        exist_records = UserFavourate.objects.filter(user=request.user,fav_id=fav_id,fav_type=fav_type)
        if exist_records:
            # 取消收藏
            exist_records.delete()
            restr = {'status': 'fail', 'msg': '收藏','delete':'True'}
            restr = json.dumps(restr)
            if int(fav_type) == 1:
                course = Course.objects.get(id=fav_id)
                course.favour_nums -= 1
                course.save()
            elif int(fav_type) == 2:
                org = CourseOrg.objects.get(id=fav_id)
                org.fav_num -= 1
                org.save()
            elif int(fav_type) == 3:
                teacher = Teacher.objects.get(id=fav_id)
                teacher.fav_num -=1
                teacher.save()

            return HttpResponse(restr, content_type='application/json')
        else:
            user_fav = UserFavourate()
            if fav_id > 0 and fav_type > 0:
                user_fav.fav_id = fav_id
                user_fav.fav_type = fav_type
                user_fav.user = request.user
                user_fav.save()

                if int(fav_type) == 1:
                    course = Course.objects.get(id=fav_id)
                    course.favour_nums += 1
                    course.save()
                elif int(fav_type) == 2:
                    org = CourseOrg.objects.get(id=fav_id)
                    org.fav_num += 1
                    org.save()
                elif int(fav_type) == 3:
                    teacher = Teacher.objects.get(id=fav_id)
                    teacher.fav_num += 1
                    teacher.save()


                restr = {'status': 'success','msg':'已经收藏'}
                restr = json.dumps(restr)
                return HttpResponse(restr, content_type='application/json')
            else:
                restr = {'status': 'fail','msg':'收藏出错'}
                restr = json.dumps(restr)
                return HttpResponse(restr, content_type='application/json')


class TeacherListView(View):
    def get(self, request):
        sort = request.GET.get("sort", "")
        all_teachers = Teacher.objects.all()
        keywords = request.GET.get('keywords', "")
        if keywords:
            all_teachers = all_teachers.filter(Q(name__icontains=keywords) |
                                           Q(work_company__icontains=keywords) |
                                           Q(trait__icontains=keywords))
        if sort=='hot':
            all_teachers = all_teachers.order_by("-click_num")
        # 对课程机构进行分页
        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1
        p = Paginator(all_teachers, 1, request=request)
        teachers = p.page(page)
        teacher_nums = all_teachers.count()

        # 教师排行榜
        rank_teacher = all_teachers.order_by("-click_num")[:3]

        return render(request, "teachers-list.html",{
            'category':'teacher',
            'teachers':teachers,
            'teacher_nums':teacher_nums,
            'rank_teacher':rank_teacher,
            'sort':sort
        })


class TeacherDetailView(View):
    def get(self, request, teacher_id):
        has_teacher_fav = has_org_fav = False
        teacher = Teacher.objects.get(id=int(teacher_id))
        teacher.click_num+=1
        teacher.save()
        if request.user.is_authenticated():
            if UserFavourate.objects.filter(user=request.user, fav_type=3, fav_id=int(teacher_id)):
                has_teacher_fav = True
            if UserFavourate.objects.filter(user=request.user, fav_type=2, fav_id=int(teacher.org.id)):
                has_org_fav = True


        rank_teacher = Teacher.objects.all().order_by("-click_num")[:3]
        return render(request, "teacher-detail.html",{
            'teacher':teacher,
            'rank_teacher': rank_teacher,
            'has_teacher_fav':has_teacher_fav,
            'has_org_fav':has_org_fav
        })






