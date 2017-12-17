from django.shortcuts import render
from django.views.generic import ListView

from ebook.models import Ebook

class BookListView(ListView):
    template_name = 'ebook_list.html'
    model = Ebook
