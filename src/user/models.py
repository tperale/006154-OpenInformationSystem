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
Author(first_name = "Wes", last_name = "McKinney").save()
Author(first_name = "Yuval Noah", last_name = "Harari").save()

#Publishers
Publisher(name = "OReilly Media").save()
Publisher(name = "Bloomsbury Publishing").save()
Publisher(name = "George Allen & Unwin (Publishers), Ltd").save()
Publisher(name = "Random House").save()

#Category
#Category_eBook

#eBooks

# Wes McKinney
#eBook(isbn = 9781491957615,title='Python for Data Analysis',version = 1,release='2017-09-01 00:00:00',author_id= 3,publisher_id= 1).save()
#Subject categories
#Computers > Programming Languages

# J. K. Rowling
#eBook(isbn = 9781405519229,title='THE CASUAL VACANCY',version = 1,release='2012-09-01 00:00:00',author_id= 2,publisher_id= 2).save()
#Subject categories
#Fiction > Genre Fiction

# J. R. R. Tolkien
# eBook(isbn = 9780007322596,title='The Lord of the Rings: The Fellowship of the Ring, The Two Towers, The Return of the King',version = 1,release='2009-05-01 00:00:00',author_id= 1,publisher_id= 3).save()
#Subject categories
#Fiction > Fantasy

#Yuval
# eBook(isbn = 9781448190690,title='A Brief History of Humankind',version = 1,release='2014-09-01 00:00:00',author_id= 4,publisher_id= 4).save()
#Subject categories
#Science > Biology


Customer(first_name = "Max", last_name = "Romain", email = "maxromai@ulb.ac.be", password = "12345").save()
Customer(first_name = "Thomas", last_name = "Peral", email = "tPeral@ulb.ac.be", password = "54321").save()
Customer(first_name = "Felipe", last_name = "Rojas", email = "frojas@vub.be", password = "rojas").save()
Customer(first_name = "Sherik", last_name = "Lehal", email = "slehal@vub.be", password = "lehal").save()

#Purchase made by Max
Purchase(done = "14/12/17", by = 1).save()
Purchase(done = "10/12/17", by = 1).save()
Purchase(done = "02/06/17", by = 1).save()

#TODO: ebook ForeignKey
UserBookPurchase(from_purchase = 1, ebook = ).save()
UserBookPurchase(from_purchase = 2, ebook = ).save()
UserBookPurchase(from_purchase = 3, ebook = ).save()

#Purchase made by Thomas
Purchase(done = "10/12/17", by = 2).save()
Purchase(done = "01/01/17", by = 2).save()

UserBookPurchase(from_purchase = 4, ebook = ).save()
UserBookPurchase(from_purchase = 5, ebook = ).save()

#Purchase made by Felipe
Purchase(done = "05/05/16", by = 3).save()
UserBookPurchase(from_purchase = 6, ebook = ).save()

#0 books for Sherik
