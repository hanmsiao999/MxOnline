#coding:utf-8
__author__ = 'mwy'
__date__ = '2017/7/31 15:08'

import xadmin
from xadmin import views
from .models import Course, Lesson, Video, CourseResource, BannerCourse

class BaseSetting(object):
    enable_themes = True
    use_bootswatch = True

class GlobalSettings(object):
    site_title = "慕学后台管理系统"
    site_footer = "慕学在线网"
    menu_style = "accordion"


class LessonInline(object):
    model = Lesson
    extra = 0

class CourseResourceInline(object):
    model = CourseResource
    extra = 0


class CourseAdmin(object):
    list_display = ['name', 'desc', 'detail', 'degree','learn_times','students','favour_nums','click_num','add_time','is_banner','get_lesson_num']
    search_fields = ['name', 'desc', 'detail', 'degree','learn_times','students','favour_nums','click_num','tag']
    list_filter = ['name', 'desc', 'detail', 'degree','learn_times','students','favour_nums','click_num','add_time','is_banner']
    ordering = ['-click_num']
    readonly_fields = ['students', 'click_num','favour_nums']
    #exclude =
    list_editable = ['degree', 'desc']
    inlines = [LessonInline, CourseResourceInline]
    refresh_times =[3, 5]
    style_fields = {'detail':"ueditor"}

    def queryset(self):
        qs = super(CourseAdmin, self).queryset()
        qs = qs.filter(is_banner=False)
        return qs

    def save_models(self):
        obj = self.new_obj
        obj.save()
        if obj.course_org is not None:
            course_org = obj.course_org
            course_org.courses_num = Course.objects.filter(course_org=course_org).count()
            course_org.save()
    import_excel = True
    def post(self, request,*args, **kwargs):
        if 'excel' in request.FILES:
            pass

class BannerCourseAdmin(object):
    list_display = ['name', 'desc', 'detail', 'degree', 'learn_times', 'students', 'favour_nums', 'click_num',
                    'add_time', 'is_banner']
    search_fields = ['name', 'desc', 'detail', 'degree', 'learn_times', 'students', 'favour_nums', 'click_num', 'tag']
    list_filter = ['name', 'desc', 'detail', 'degree', 'learn_times', 'students', 'favour_nums', 'click_num',
                   'add_time', 'is_banner']
    ordering = ['-click_num']
    readonly_fields = ['students', 'click_num', 'favour_nums']
    # exclude =
    inlines = [LessonInline, CourseResourceInline]

    def queryset(self):
        qs = super(BannerCourseAdmin, self).queryset()
        qs = qs.filter(is_banner=True)
        return qs

class VideoAdmin(object):
    list_display = ['lesson','name','add_time']
    search_fields = ['lesson','name']
    list_filter =['lesson__name','name','add_time']

class LessonAdmin(object):
    list_display = ['course', 'name', 'add_time']
    search_fields = ['course', 'name']
    list_filter = ['course__name', 'name', 'add_time']
    # def courseNameAdmin(self, obj):
    #     return obj.name

class CourseResourceAdmin(object):
    list_display = ['course', 'name','download', 'add_time']
    search_fields = ['course', 'name','download']
    list_filter = ['course', 'name','download', 'add_time']


xadmin.site.register(Course, CourseAdmin)
xadmin.site.register(Video, VideoAdmin)
xadmin.site.register(Lesson,LessonAdmin)
xadmin.site.register(CourseResource,CourseResourceAdmin )
xadmin.site.register(BannerCourse,BannerCourseAdmin )
xadmin.site.register(views.BaseAdminView, BaseSetting)
xadmin.site.register(views.CommAdminView, GlobalSettings)