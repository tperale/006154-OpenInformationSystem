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

#Category

#eBooks
eBook1 = eBook(isbn = 9781491957615,title='Python for Data Analysis',version = 1,release='2017-09-01 00:00:00',author3,publisher1)
eBook2 = eBook(isbn = 9781405519229,title='THE CASUAL VACANCY',version = 1,release='2012-09-01 00:00:00',author2,publisher2)
eBook3 = eBook(isbn = 9780007322596,title='The Lord of the Rings: The Fellowship of the Ring, The Two Towers, The Return of the King',version = 1,release='2009-05-01 00:00:00',author1,publisher3)

eBook1.save()
eBook2.save()
eBook3.save()

#customer
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

purchase1.save()
purchase2.save()
purchase3.save()

Customer1Purchase1 = UserBookPurchase(from_purchase = purchase1, ebook = eBook1)
Customer1Purchase2 = UserBookPurchase(from_purchase = purchase2, ebook = eBook2)
Customer1Purchase3 = UserBookPurchase(from_purchase = purchase3, ebook = eBook3)

Customer1Purchase1.save()
Customer1Purchase2.save()
Customer1Purchase3.save()

#Purchase made by Thomas
purchase4 = Purchase(done = "10/12/17", by = customer2)
purchase5 = Purchase(done = "01/01/17", by = customer2)

purchase4.save()
purchase5.save()

Customer2Purchase1 = UserBookPurchase(from_purchase = purchase4, ebook = eBook2)
Customer2Purchase2 = UserBookPurchase(from_purchase = purchase5, ebook = eBook3)

Customer2Purchase1.save()
Customer2Purchase2.save()

#Purchase made by Felipe
purchase6 = Purchase(done = "05/05/16", by = customer3)
purchase6.save()

Customer3Purchase1 = UserBookPurchase(from_purchase = purchase6, ebook = eBook1)

Customer3Purchase1.save()
#0 books for Sherik

# ----- Rating datas -----
# Max - Thomas rate 5 for LOTR
rateMaxLotr = Rating(ebook = eBook3, by = customer1, rate = 5)
rateThomasLotr = Rating(ebook = eBook3, by = customer2, rate = 5)

rateMaxLotr.save()
rateThomasLotr.save()

#Felipe rate 1 for LOTR
rateFelipeLotr = Rating(ebook = eBook3, by = customer3, rate = 1)
rateFelipeLotr.save()

rateThomasPy = Rating(ebook = eBook1, by = customer2, rate = 3)
rateMaxPy = Rating(ebook = eBook1, by = customer2, rate = 3)

rateThomasPy.save()
rateMaxPy.save()

# ----- Categoris Datas -----
actionC = Category(name = "Action", subCatOf = null)
fantasticC = Category(name = "Fantastic", subCatOf = actionC)
magicC = Category(name = "Magic", subCatOf = actionC)
warC = Category(name = "War", subCatOf = actionC)
medievalC = Category(name = "Mediaval", subCatOf = fantasticC)

learningC = Category(name = "Learning", subCatOf = null)
programmingC = Category(name = "Programming", subCatOf = learningC)

romanC = Category(name = "Roman", subCatOf = null)

actionC.save()
fantasticC.save()
magicC.save()
warC.save()
medievalC.save()
learningC.save()
programmingC.save()
romanC.save()

BookCategory(ebook = eBook1, category = programmingC).save()

BookCategory(ebook = eBook3, category = fantasticC).save()
BookCategory(ebook = eBook3, category = warC).save()
BookCategory(ebook = eBook3, category = medievalC).save()

BookCategory(ebook = eBook2, category = romanC).save()
