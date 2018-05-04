from django.conf.urls import url, include
from django.contrib import admin

from . import views

admin.autodiscover()

urlpatterns = [
    url(r'^$', views.index, name='index'),
    url(r'^contact/', views.contact, name='contact'),
    url(r'^checkout/', views.checkout, name='checkout'),
    url(r'^dashboard/', views.dashboard, name='dashboard'),
    url(r'^lawyer_dashboard/', views.lawyer_dashboard, name='lawyer_dashboard'),
    url(r'^client_dashboard/', views.client_dashboard, name='client_dashboard'),
    url(r'^form_builder/', views.form_builder, name='form_builder'),
    url(r'^form_filler/', views.form_filler, name='form_filler'),
    url(r'^get_form/', views.get_form, name='get_form'),
    url(r'^post_form/', views.post_form, name='post_form'),
    url(r'^save_form/', views.save_form, name='save_form'),
    url(r'^user/', views.user, name='user'),
    url(r'^new_user/', views.new_user, name='new_user'),
    url(r'^doc_finder/', views.doc_finder, name='doc_finder'),
    url(r'^doc_editor/', views.doc_editor, name='doc_editor'),
    url(r'^suggest_pieces/', views.suggest_pieces, name='suggest_pieces'),
    url(r'^load_pieces/', views.load_pieces, name='load_pieces'),
    url(r'^final_doc/', views.final_doc, name='final_doc'),
    url(r'^tinymce/', include('tinymce.urls')),
    url(r'^plotly/', views.plotly, name='plotly'),
    url(r'^new_piece/', views.new_piece, name='new_piece'),
    url(r'^map/', views.map, name='map'),

]
