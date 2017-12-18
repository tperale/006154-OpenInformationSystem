from django.db import models
from django.contrib import admin
from django.contrib.auth.models import User

# class PayInformation(models.Model):
#     card_holder = models.TextField()
#     card_number = models.NumberField()
#     expiration_month = models.DateField()
#     expiration_year = models.DateField()

# class Customer(User):
#     # pay_information = models.OneToMany('PayInformation')
#     purchases = models.OneToMany('Purchase')
#     ratings = models.OneToMany('ebook.ratings')

class Author(models.Model):
    first_name = models.TextField()
    last_name = models.TextField()

class Purchase(models.Model):
    done = models.DateTimeField(auto_now=True)
    by = models.ForeignKey(User, on_delete=models.CASCADE)

class UserBookPurchase(models.Model):
    from_purchase = models.ForeignKey('Purchase', on_delete=models.CASCADE)
    ebook = models.ForeignKey('ebook.ebook', on_delete=models.CASCADE)

admin.site.register(Author)
admin.site.register(Purchase)
admin.site.register(UserBookPurchase)
