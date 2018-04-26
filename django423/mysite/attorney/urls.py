from django.conf.urls import url, include
from django.contrib import admin

from . import views

admin.autodiscover()

urlpatterns = [
    url(r'^$', views.index, name='index'),
    url(r'^contact/', views.contact, name='contact'),
    url(r'^suggest_piece/', views.suggest_piece, name='suggest_piece'),
    url(r'^my_dashboard/', views.my_dashboard, name='my_dashboard'),
    url(r'^dashboard/', views.dashboard, name='dashboard'),
    url(r'^new_piece/', views.new_piece, name='new_piece'),
    url(r'^final_doc/', views.final_doc, name='final_doc'),
    url(r'^user/', views.user, name='user'),
    url(r'^map/', views.map, name='map'),
    url(r'^new_user/', views.new_user, name='new_user'),
    url(r'^tinymce/', include('tinymce.urls')),

]
