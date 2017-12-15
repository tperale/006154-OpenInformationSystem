from django.db import models
from django.contrib.auth.models import User
from django.core.validators import MaxValueValidator, MinValueValidator

class Category(models.Model):
    name = models.TextField(blank=False)

class SubCategory(models.Model):
    parent = models.ForeignKey(Category, on_delete=models.CASCADE)
    name = models.TextField(blank=False)

class BookCategory(models.Model):
    ebook = models.ForeignKey('Ebook', on_delete=models.CASCADE)
    category = models.ForeignKey('Category', on_delete=models.CASCADE)

class Rating(models.Model):
    ebook = models.ForeignKey('Ebook', on_delete=models.CASCADE)
    by = models.ForeignKey(User, on_delete=models.CASCADE)
    rate = models.IntegerField(validators=[MaxValueValidator(5), MinValueValidator(1)])

class Publisher(models.Model):
    name = models.TextField()

class Ebook(models.Model):
    isbn = models.CharField(max_length=13, primary_key=True)
    author = models.ForeignKey('user.Author', on_delete=models.CASCADE)
    publisher = models.ForeignKey('Publisher', on_delete=models.CASCADE)
    title = models.TextField(blank=False)
    version = models.IntegerField(default=1)
    release = models.DateTimeField(blank=False)
