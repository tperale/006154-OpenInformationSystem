from django.conf.urls import url
from django.contrib.auth import views as auth_views
from user import views

urlpatterns = [
    url(r'^login/$', auth_views.login, {'template_name': 'login.html'}, name='login'),
    url(r'^logout/$', auth_views.logout, {'template_name': 'logout.html', 'next_page': '/'}, name='logout'),
    url(r'^profile/$', views.profile, name='profile'),
    url(r'^signup/$', views.signup, name='signup'),
]
