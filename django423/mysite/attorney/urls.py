from django.conf.urls import url, include
from django.contrib import admin

from . import views

admin.autodiscover()

urlpatterns = [
    url(r'^$', views.index, name='index'),
    url(r'^contact/', views.contact, name='contact'),
    url(r'^suggest_piece/', views.suggest_piece, name='suggest_piece'),
    url(r'^final_doc/', views.filestack_doc, name='filestack_doc'),
    url(r'^tinymce/', include('tinymce.urls')),
    ]
