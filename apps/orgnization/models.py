#coding:utf-8
from __future__ import unicode_literals

from django.db import models
from datetime import datetime
# Create your models here.

class CityDict(models.Model):
    name = models.CharField(max_length=20, verbose_name=u'城市名')
    add_time = models.DateTimeField(default=datetime.now, verbose_name='添加时间')
    desc = models.CharField(max_length=200, verbose_name='描述')


    class Meta:
        verbose_name = '城市'
        verbose_name_plural = verbose_name

    def __unicode__(self):
        return self.name



class CourseOrg(models.Model):
       name = models.CharField(max_length=50, verbose_name='机构名称')
       dec = models.TextField(verbose_name='机构描述')
       category = models.CharField(default='pxjg',verbose_name=u'机构类别',max_length=20, choices=(('pxjg','培训机构'),('gx','高校'),('gr','个人')))
       click_num = models.IntegerField(default=0, verbose_name='点击数')
       fav_num = models.IntegerField(default=0, verbose_name='收藏数')
       image = models.ImageField(upload_to='org/%Y/%m', verbose_name='封面图', max_length=100)
       address = models.CharField(max_length=100, verbose_name='机构地址')
       city = models.ForeignKey(CityDict, verbose_name='所在城市')
       add_time = models.DateTimeField(default=datetime.now, verbose_name='添加时间')
       students_num = models.IntegerField(default=0, verbose_name='学习人数')
       courses_num = models.IntegerField(default=0, verbose_name='课程数')
       tag = models.CharField(max_length=10, verbose_name="机构标签",default="全国知名")

       def get_course_num(self):
           return self.course_set.all().count()

       get_course_num.short_description = '统计课程数'



       class Meta:
           verbose_name = '课程机构'
           verbose_name_plural = verbose_name

       def __unicode__(self):
           return self.name


class Teacher(models.Model):
      org = models.ForeignKey(CourseOrg, verbose_name="所属机构")
      name = models.CharField(max_length=20, verbose_name='教师名称')
      work_years = models.IntegerField(verbose_name=u'工作年限')
      work_company = models.CharField(max_length=50, verbose_name=u'就职公司')
      work_position = models.CharField(max_length=50, verbose_name=u'工作职位')
      trait = models.CharField(max_length=50, verbose_name=u'教学特点')
      click_num = models.IntegerField(default=0, verbose_name='点击数')
      fav_num = models.IntegerField(default=0, verbose_name='收藏数')
      add_time = models.DateTimeField(default=datetime.now, verbose_name='添加时间')
      image = models.ImageField(default="",upload_to='teacher/%Y/%m', verbose_name='教师头像', max_length=100)
      age = models.IntegerField(default=20, verbose_name='年龄')

      class Meta:
          verbose_name = u'教师'
          verbose_name_plural = verbose_name

      def __unicode__(self):
          return self.name

      def get_courses(self):
          return self.course_set.all()

      def get_courses_count(self):
          return self.course_set.all().count()
