from django.contrib import admin

from main.models import User, Plan, Course, UsersToApprove, AdminData

# Register your models here.

admin.site.register(User)
admin.site.register(Plan)
admin.site.register(Course)
admin.site.register(UsersToApprove)
admin.site.register(AdminData)
