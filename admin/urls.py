from . import views
from django.conf.urls import url, include
from django.contrib import admin

urlpatterns = [


    url(r'^$', views.adminview, name='adminview'),
]