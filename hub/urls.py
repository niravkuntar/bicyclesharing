from django.conf.urls import url
from hub.views import index 
from . import views
from django.contrib import admin


urlpatterns = [
    url(r'^$', views.index, name='index'),
]
