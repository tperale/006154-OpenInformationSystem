from django.shortcuts import render
from django.views.generic import ListView, DetailView
from django.shortcuts import redirect, get_object_or_404
from django.contrib.auth.decorators import login_required
from search_listview.list import SearchableListView

from ebook.models import Ebook, Rating
from ebook.forms import EbookForm

from user.models import Purchase, UserBookPurchase

class BookListView(SearchableListView):
    template_name = 'ebook_list.html'
    model = Ebook
    paginate_by = 10
    # searchable_fields = ['title', 'isbn', 'author__first_name', 'author__last_name', 'publisher__name']
    searchable_fields = ['title']
    # specifications = {
    #     "title": "__icontains"
    # }

class BookDetailView(SearchableListView):
    template_name = 'ebook_detail.html'
    model = Ebook

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        obj = get_object_or_404(Ebook, isbn=self.kwargs.get('slug', None))
        context['ebook'] = obj
        return context

@login_required
def book_buy(request, slug):
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

@login_required
def book_rate(request, slug):
    if request.method == 'POST':
        rating = request.POST.getlist('rate')
        rating = rating[0]
        user = request.user
        ebook = Ebook.objects.get(isbn=slug)

        rate = Rating.objects.filter(by=user, ebook=ebook)

        if len(rate):
            rate.update(rate=rating)
        else:
            rate = Rating(by=user, ebook=ebook, rate=rating)
            rate.save()

    return redirect('ebook')
