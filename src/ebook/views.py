from django.shortcuts import render
from django.views.generic import ListView
from django.shortcuts import redirect
from django.contrib.auth.decorators import login_required

from ebook.models import Ebook
from ebook.forms import EbookForm

from user.models import Purchase, UserBookPurchase

class BookListView(ListView):
    template_name = 'ebook_list.html'
    model = Ebook


@login_required
def book_buy(request, slug):
    print(slug)
    user = request.user

    ebook = Ebook.objects.get(isbn=slug)

    purchases = Purchase.objects.filter(by=user)
    for p in purchases:
        purchases = UserBookPurchase.objects.filter(from_purchase=p)
        if purchases.filter(ebook=ebook):
            # already buyed
            print("already buyed")
            return redirect('ebook')

    if ebook:
        purchase = Purchase(by=user)
        purchase.save()

        link = UserBookPurchase(from_purchase=purchase, ebook=ebook)
        link.save()


    return redirect('ebook')
