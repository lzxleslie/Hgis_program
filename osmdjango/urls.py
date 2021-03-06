"""osmdjango URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.8/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Add an import:  from blog import urls as blog_urls
    2. Add a URL to urlpatterns:  url(r'^blog/', include(blog_urls))
"""
from django.conf.urls import include, url
from django.contrib import admin
from django.contrib.staticfiles.urls import staticfiles_urlpatterns 
admin.autodiscover()

urlpatterns = [
    url(r'^login/$', 'disk.views.Login',  name='login'),
    url(r'^logout/$', 'disk.views.Logout', name='logout'),
    url(r'^register', 'disk.views.register', name='register'),
    url(r'^upload', 'disk.views.upload'),
    url(r'^main', 'disk.views.main', name='main'),
    url(r'^map/(\w+)/$','disk.views.mapEdit',name='map'),
    url(r'^getLayers/$','disk.views.getLayersFromMml'),
    url(r'^modifylayer/(\d+)/$','disk.views.modifyLayer'),
    url(r'^table/$','disk.views.datapage',name='datatable'),
    url(r'^table/(\d+)/$','disk.views.table',name='datatable'),
    url(r'^tilelistbyregion', 'disk.views.tilelistbyregion'),
    url(r'^(\w+)/(\d+)/(\d+)/(\d+).(\w+)/$', 'disk.views.tile', name='tile'),  
    url(r'^angular_test/$','disk.views.angular',name='map'),
    url(r'^huibiao_test/$','disk.views.huibiao'),
    url(r'^map_Template/(\w+)/$','disk.views.getMssTemplate'),
    url(r'^admin/', include(admin.site.urls)),
]
urlpatterns += staticfiles_urlpatterns()  
