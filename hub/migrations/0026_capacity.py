# -*- coding: utf-8 -*-
# Generated by Django 1.9.4 on 2016-05-22 20:51
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('hub', '0025_hubdetails_newavailable'),
    ]

    operations = [
        migrations.CreateModel(
            name='capacity',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('total', models.IntegerField()),
            ],
        ),
    ]