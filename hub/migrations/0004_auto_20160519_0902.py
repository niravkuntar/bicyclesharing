# -*- coding: utf-8 -*-
# Generated by Django 1.9.4 on 2016-05-19 09:02
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('hub', '0003_auto_20160519_0854'),
    ]

    operations = [
        migrations.AlterField(
            model_name='hubdetails',
            name='name',
            field=models.CharField(max_length=255),
        ),
        migrations.AlterField(
            model_name='landmark',
            name='name',
            field=models.CharField(max_length=255),
        ),
        migrations.AlterField(
            model_name='registrationdetails',
            name='courseno',
            field=models.CharField(max_length=30),
        ),
        migrations.AlterField(
            model_name='studentdetails',
            name='location',
            field=models.CharField(max_length=255),
        ),
        migrations.AlterField(
            model_name='studentdetails',
            name='name',
            field=models.CharField(max_length=255),
        ),
        migrations.AlterField(
            model_name='timetable',
            name='courseno',
            field=models.CharField(max_length=30),
        ),
    ]
