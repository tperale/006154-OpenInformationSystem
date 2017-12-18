from django.db import models
from django.contrib.auth.models import User
from django.contrib import admin
from django.core.validators import MaxValueValidator, MinValueValidator

class Publisher(models.Model):
    name = models.TextField()

class Ebook(models.Model):
    isbn = models.CharField(max_length=13, primary_key=True)
    author = models.ForeignKey('user.Author', on_delete=models.CASCADE)
    publisher = models.ForeignKey(Publisher, on_delete=models.CASCADE)
    title = models.TextField(blank=False)
    version = models.IntegerField(default=1)
    release = models.DateTimeField(blank=False)

class Category(models.Model):
    name = models.TextField(blank=False)
    subCatOf = models.ForeignKey("self", on_delete=models.CASCADE, null = True, blank = True)

class BookCategory(models.Model):
    ebook = models.ForeignKey(Ebook, on_delete=models.CASCADE)
    category = models.ForeignKey(Category, on_delete=models.CASCADE)

class Rating(models.Model):
    ebook = models.ForeignKey(Ebook, on_delete=models.CASCADE)
    by = models.ForeignKey(User, on_delete=models.CASCADE)
    rate = models.IntegerField(validators=[MaxValueValidator(5), MinValueValidator(1)])

admin.site.register(Publisher)
admin.site.register(Ebook)
admin.site.register(Category)
admin.site.register(BookCategory)
admin.site.register(Rating)
