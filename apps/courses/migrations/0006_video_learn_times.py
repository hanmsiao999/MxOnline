# -*- coding: utf-8 -*-
# Generated by Django 1.9.8 on 2017-08-07 21:49
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('courses', '0005_auto_20170806_1619'),
    ]

    operations = [
        migrations.AddField(
            model_name='video',
            name='learn_times',
            field=models.IntegerField(default=0, verbose_name='\u89c6\u9891\u65f6\u957f(\u5206\u949f\u6570)'),
        ),
    ]
