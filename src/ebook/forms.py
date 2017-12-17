from django import forms
from ebook.models import Ebook

class EbookForm(forms.Form):
    ebook = forms.ModelChoiceField(queryset=Ebook.objects.all())
