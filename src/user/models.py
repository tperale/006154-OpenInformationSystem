from django.db import models
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


# ----- DATAS INSERTION -----
Author(first_name = "J. R. R.", last_name = "Tolkien").save()
Author(first_name = "J. K.", last_name = "Rowling").save()

Customer(first_name = "Max", last_name = "Romain", email = "maxromai@ulb.ac.be", password = "12345")
Customer(first_name = "Thomas", last_name = "Peral", email = "tPeral@ulb.ac.be", password = "54321")
Customer(first_name = "Felipe", last_name = "Rojas", email = "frojas@vub.be", password = "rojas")
Customer(first_name = "Sherik", last_name = "Lehal", email = "slehal@vub.be", password = "lehal")

#Purchase made by Max
Purchase(done = "14/12/17", by = 1)
Purchase(done = "10/12/17", by = 1)
Purchase(done = "02/06/17", by = 1)

#TODO: ebook ForeignKey
UserBookPurchase(from_purchase = 1, ebook = )
UserBookPurchase(from_purchase = 2, ebook = )
UserBookPurchase(from_purchase = 3, ebook = )

#Purchase made by Thomas
Purchase(done = "10/12/17", by = 2)
Purchase(done = "01/01/17", by = 2)

UserBookPurchase(from_purchase = 4, ebook = )
UserBookPurchase(from_purchase = 5, ebook = )

#Purchase made by Felipe
Purchase(done = "05/05/16", by = 3)
UserBookPurchase(from_purchase = 6, ebook = )

#0 books for Sherik
