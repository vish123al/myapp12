# -*- coding: utf-8 -*-
# Generated by Django 1.9 on 2016-04-14 08:06
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('stockapp', '0005_auto_20160414_0805'),
    ]

    operations = [
        migrations.AlterField(
            model_name='info',
            name='dividend_yield',
            field=models.CharField(default='0', editable=False, max_length=20),
        ),
    ]
