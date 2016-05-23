# -*- coding: utf-8 -*-
# Generated by Django 1.9.4 on 2016-05-21 17:52
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('hub', '0021_auto_20160521_1751'),
    ]

    operations = [
        migrations.CreateModel(
            name='HubCycle',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('cycleid', models.IntegerField()),
                ('hubid', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='hub.HubDetails')),
            ],
        ),
    ]