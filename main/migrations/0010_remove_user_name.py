# Generated by Django 4.2.4 on 2023-09-02 10:27

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('main', '0009_admindata'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='user',
            name='name',
        ),
    ]
