from django.db import models
from django.contrib.auth.models import User

# ----- DATAS INSERTION -----
author1 =  Author(first_name = "J. R. R.", last_name = "Tolkien")
author2 =  Author(first_name = "J. K.", last_name = "Rowling")
author3 =  Author(first_name = "Wes", last_name = "McKinney")
author4 =  Author(first_name = "Yuval Noah", last_name = "Harari")

author1.save()
author2.save()
author3.save()
author4.save()

#Publishers
publisher1 = Publisher(name = "OReilly Media")
publisher2 = Publisher(name = "Bloomsbury Publishing")
publisher3 = Publisher(name = "George Allen & Unwin (Publishers), Ltd")
publisher4 = Publisher(name = "Random House")

publisher1.save()
publisher2.save()
publisher3.save()
publisher4.save()

customer1 = Customer(first_name = "Max", last_name = "Romain", email = "maxromai@ulb.ac.be", password = "12345")
customer2 = Customer(first_name = "Thomas", last_name = "Peral", email = "tPeral@ulb.ac.be", password = "54321")
customer3 = Customer(first_name = "Felipe", last_name = "Rojas", email = "frojas@vub.be", password = "rojas")
customer4 = Customer(first_name = "Sherik", last_name = "Lehal", email = "slehal@vub.be", password = "lehal")

customer1.save()
customer2.save()
customer3.save()
customer4.save()

#Purchase made by Max
purchase1 = Purchase(done = "14/12/17", by = customer1)
purchase2 = Purchase(done = "10/12/17", by = customer1)
purchase3 = Purchase(done = "02/06/17", by = customer1)

#TODO: ebook ForeignKey
UserBookPurchase(from_purchase = purchase1, ebook = ).save()
UserBookPurchase(from_purchase = purchase2, ebook = ).save()
UserBookPurchase(from_purchase = purchase3, ebook = ).save()

#Purchase made by Thomas
purchase4 = Purchase(done = "10/12/17", by = customer2)
purchase5 = Purchase(done = "01/01/17", by = customer2)

purchase4.save()
purchase5.save()

UserBookPurchase(from_purchase = purchase4, ebook = ).save()
UserBookPurchase(from_purchase = purchase5, ebook = ).save()

#Purchase made by Felipe
purchase6 = Purchase(done = "05/05/16", by = customer3)

UserBookPurchase(from_purchase = purchase6, ebook = ).save()

#0 books for Sherik