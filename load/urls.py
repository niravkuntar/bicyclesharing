from . import views
from django.conf.urls import url, include


urlpatterns = [
    url(r'^$', views.auth_login, name='login'),
    url(r'^logout/', views.auth_logout, name='logout'),
    url(r'^signup/', views.auth_signup, name='signup'),
]
