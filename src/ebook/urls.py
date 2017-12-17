from django.conf.urls import url
from django.contrib.auth import views as auth_views
from ebook import views

urlpatterns = [
    url(r'^', views.BookListView.as_view(), name="ebook"),
]
