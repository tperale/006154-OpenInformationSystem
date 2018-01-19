from django.conf.urls import url
from django.contrib.auth import views as auth_views
from ebook import views

urlpatterns = [
    url(r'^buy_ebook/(?P<slug>\d+)', views.book_buy, name="ebook_purchase"),
    url(r'^(?P<slug>\d+)', views.BookDetailView.as_view(), name="ebook_detail"),
    url(r'^', views.BookListView.as_view(), name="ebook"),
]
