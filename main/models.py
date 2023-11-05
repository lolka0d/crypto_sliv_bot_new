from django.db import models


# Create your models here.


class User(models.Model):
    user_id = models.PositiveBigIntegerField(blank=True, null=True)
    hash = models.CharField(max_length=100, null=True, blank=True)  # delete this field
    is_active = models.BooleanField(default=False)
    is_admin = models.BooleanField(default=False)
    plan = models.CharField(max_length=100)
    course = models.CharField(max_length=100)
    active_to = models.DateTimeField()
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f'{self.user_id}'


class Plan(models.Model):
    name = models.CharField(max_length=100)
    description = models.TextField()
    created_at = models.DateTimeField(auto_now_add=True)
    channels = models.TextField()

    def __str__(self):
        return f'{self.name} - {self.created_at}'


class Course(models.Model):
    name = models.CharField(max_length=100)
    description = models.TextField()
    created_at = models.DateTimeField(auto_now_add=True)
    courses = models.TextField()

    def __str__(self):
        return f'{self.name} - {self.created_at}'


class UsersToApprove(models.Model):
    name = models.CharField(max_length=100)
    channel_id = models.BigIntegerField()
    users_ids = models.TextField()
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f'{self.name} - {self.channel_id}'


class AdminData(models.Model):
    name = models.CharField(max_length=100)
    data = models.TextField()

    def __str__(self):
        return f'{self.name}'
