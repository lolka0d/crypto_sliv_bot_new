from django.contrib import admin
from django.urls import path

from main.views import webhook, page_not_found, server_error, picture, home

urlpatterns = [
    path('webhook/', webhook, name='webhook'),
    path('picture/<str:name>/', picture, name='webhook'),
    path('', home, name='home'),

]

handler404 = 'main.views.page_not_found'
handler500 = 'main.views.server_error'
