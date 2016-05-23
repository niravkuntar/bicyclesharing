from . import views
from django.conf.urls import url, include


urlpatterns = [
    url(r'^$', views.studentview, name='student'),
    url(r'^booking/', views.currentbookings, name='booking'),
    url(r'^history/', views.history, name='history'),

]
