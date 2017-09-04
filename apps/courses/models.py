#coding:utf-8
from __future__ import unicode_literals

from django.db import models
from DjangoUeditor.models import UEditorField

from datetime import datetime
from orgnization.models import CourseOrg, Teacher
# Create your models here.


class Course(models.Model):
    course_org = models.ForeignKey(CourseOrg, verbose_name="课程机构",null=True, blank=True)
    name = models.CharField(max_length=50, verbose_name="课程名")
    desc = models.CharField(max_length=300, verbose_name="课程描述")
    #detail = models.TextField(verbose_name="课程详情")
    detail = UEditorField(verbose_name="课程详情",width=600, height=300, imagePath="courses/ueditor/",
                          filePath="courses/ueditor/",
                          default="")

    degree = models.CharField(verbose_name="难度",choices=(('cj','初级'),('zj','中级'),('gj','高级')), max_length=2)
    learn_times = models.IntegerField(default=0, verbose_name=u"学习时长")
    students = models.IntegerField(default=0, verbose_name=u"学习人数")
    favour_nums = models.IntegerField(default=0, verbose_name=u"收藏人数")
    image = models.ImageField(max_length=100,upload_to="courses/%Y/%m", verbose_name=u"封面图")
    click_num = models.IntegerField(default=0, verbose_name=u"点击数")
    add_time = models.DateTimeField(default=datetime.now,verbose_name=u"添加时间")
    teacher = models.ForeignKey(Teacher, verbose_name="任课教师",null=True, blank=True )
    category = models.CharField(max_length=20, verbose_name='课程类别',null=True, blank=True)
    need_know = models.CharField(max_length=200, verbose_name='课程须知',null=True, blank=True)
    teacher_tell = models.CharField(max_length=200, verbose_name='讲师告诉你', null=True, blank=True)
    cource_notice = models.CharField(max_length=100, verbose_name='课程公告', null=True, blank=True)
    is_banner = models.BooleanField(default=False)

    class Meta:
          verbose_name = u'课程'
          verbose_name_plural = verbose_name

    def __unicode__(self):
        return self.name

    def get_lesson_num(self):
        return self.lesson_set.all().count()

    get_lesson_num.short_description = '章节数'

    def get_learn_users(self):
        a = self.usercourse_set.all()[:5]
        return a

    def get_course_resource(self):
        return self.courseresource_set.all()

    def get_lesson(self):
        return self.lesson_set.all()


class BannerCourse(Course):
    class Meta:
          verbose_name = u'轮播课程'
          verbose_name_plural = verbose_name
          proxy = True



class Lesson(models.Model):
    course = models.ForeignKey(Course, verbose_name="课程")
    name = models.CharField(max_length=100, verbose_name="章节名")
    add_time = models.DateTimeField(default=datetime.now, verbose_name=u"添加时间")

    class Meta:
         verbose_name = "章节"
         verbose_name_plural = verbose_name

    def __unicode__(self):
        return self.name

    def get_video(self):
        return self.video_set.all()


class Video(models.Model):
    lesson = models.ForeignKey(Lesson, verbose_name="章节")
    name = models.CharField(max_length=100, verbose_name="视频名称")
    learn_times = models.IntegerField(default=0, verbose_name=u"视频时长(分钟数)")
    url = models.CharField(max_length=200, verbose_name="视频地址", default="")
    add_time = models.DateTimeField(default=datetime.now, verbose_name=u"添加时间")

    class Meta:
         verbose_name = u"视频"
         verbose_name_plural = verbose_name

    def __unicode__(self):
        return self.name

class CourseResource(models.Model):
    course = models.ForeignKey(Course, verbose_name=u"课程")
    name = models.CharField(max_length=100, verbose_name=u"名称")
    download = models.FileField(upload_to="course/resource/%Y/%m" ,verbose_name=u'资源文件', max_length=100)
    add_time = models.DateTimeField(default=datetime.now, verbose_name=u"添加时间")

    class Meta:
         verbose_name = u"课程资源"
         verbose_name_plural = verbose_name

    def  __unicode__(self):
        return self.name