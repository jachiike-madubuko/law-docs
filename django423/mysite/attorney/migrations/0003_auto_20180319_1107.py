# -*- coding: utf-8 -*-
# Generated by Django 1.11.10 on 2018-03-19 11:07
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):
    dependencies = [
        ('attorney', '0002_auto_20180319_1106'),
    ]

    operations = [
        migrations.AlterField(
            model_name='firm',
            name='firmID',
            field=models.AutoField(db_column='firmID', max_length=9, primary_key=True, serialize=False, unique=True),
        ),
    ]