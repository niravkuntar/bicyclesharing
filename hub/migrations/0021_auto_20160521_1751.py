# -*- coding: utf-8 -*-
# Generated by Django 1.9.4 on 2016-05-21 17:51
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('hub', '0020_hubcycle'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='hubcycle',
            name='hubid',
        ),
        migrations.DeleteModel(
            name='HubCycle',
        ),
    ]