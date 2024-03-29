from django.shortcuts import render
from django.views.generic import TemplateView
from ebook.models import Ebook
from random import sample

class Welcome(TemplateView):
    template_name = "home.html"

    def get_context_data(self, **kwargs):
        books = Ebook.objects.all()
        if len(books) > 3:
            return {'recommended': sample(list(books), 3)}
        return {'recommended': list(books)}
