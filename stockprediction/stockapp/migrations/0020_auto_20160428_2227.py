# -*- coding: utf-8 -*-
# Generated by Django 1.9.5 on 2016-04-28 22:27
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('stockapp', '0019_compare'),
    ]

    operations = [
        migrations.RenameModel(
            old_name='compare',
            new_name='COMP',
        ),
    ]
