# -*- coding: utf-8 -*-
# Generated by Django 1.9.4 on 2016-05-21 20:00
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('hub', '0023_history'),
    ]

    operations = [
        migrations.AddField(
            model_name='hubcycle',
            name='available',
            field=models.BooleanField(default=True),
        ),
    ]
