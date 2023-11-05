# Generated by Django 4.2.4 on 2023-08-21 19:22

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('main', '0007_channelid_alter_user_hash'),
    ]

    operations = [
        migrations.CreateModel(
            name='UsersToApprove',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=100)),
                ('channel_id', models.BigIntegerField()),
                ('users_ids', models.TextField()),
                ('created_at', models.DateTimeField(auto_now_add=True)),
            ],
        ),
        migrations.DeleteModel(
            name='ChannelId',
        ),
    ]