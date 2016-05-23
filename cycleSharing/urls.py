from . import views
from hub.views import index
from hub import urls as huburl
from load import urls as loadurl
from admin import urls as adminurl
from student import urls as studenturl
from django.conf.urls import url, include

urlpatterns = [
    url(r'^$', views.welcome, name='welcome'),
    url(r'^admin/', include(adminurl)),
    url(r'^student/', include(studenturl)),
    url(r'^hubs/', include(huburl)),
    url(r'^availability/', views.availability,name='availability'),
    url(r'^login/', include(loadurl)),
    url(r'^how/', views.how),
    url(r'^use/', views.use),
]