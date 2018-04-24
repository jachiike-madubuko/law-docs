from django.conf.urls import url, include
from django.contrib import admin

from . import views

admin.autodiscover()

urlpatterns = [
    url(r'^$', views.index, name='index'),
    url(r'^contact/', views.contact, name='contact'),
    url(r'^suggest_piece/', views.suggest_piece, name='suggest_piece'),
    url(r'^final_doc/', views.final_doc, name='final_doc'),
    url(r'^tinymce/', include('tinymce.urls')),
    ]
