from django.shortcuts import render
from django.views.generic import TemplateView

class Welcome(TemplateView):
    template_name = "home.html"

    def get_context_data(self, **kwargs):
        context = super(Welcome, self).get_context_data(**kwargs)
        return context
