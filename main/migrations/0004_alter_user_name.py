# Generated by Django 4.2.3 on 2023-07-26 12:38

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('main', '0003_alter_user_name_alter_user_user_id'),
    ]

    operations = [
        migrations.AlterField(
            model_name='user',
            name='name',
            field=models.CharField(default='', max_length=100, null=True),
        ),
    ]
