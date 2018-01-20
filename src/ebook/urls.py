from django.conf.urls import url
from django.contrib.auth import views as auth_views
from ebook import views

urlpatterns = [
    url(r'^category/(?P<slug>\d+)$', views.BookForCategoryView.as_view(), name='ebook_category'),
    url(r'^categories/', views.CategoriesView.as_view(), name='ebook_categories'),
    url(r'^author/(?P<slug>\d+)$', views.AuthorBookView.as_view(), name='ebook_author'),
    url(r'^(?P<slug>\d+)/purchase', views.book_buy, name="ebook_purchase"),
    url(r'^(?P<slug>\d+)/rate', views.book_rate, name="ebook_rate"),
    url(r'^(?P<slug>\d+)', views.BookDetailView.as_view(), name="ebook_detail"),
    url(r'^', views.BookListView.as_view(), name="ebook"),
]
