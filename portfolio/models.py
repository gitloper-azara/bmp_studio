""" Models module for MySQL
"""
import os
from django.db import models
from django.utils import timezone
from django import forms
from imagekit.models import ImageSpecField
from imagekit.processors import resize


class Category(models.Model):
    """ Category class
    """
    name = models.CharField(max_length=255, unique=True)
    description = models.TextField(blank=True, null=True)

    def __str__(self) -> str:
        """ Returns the string representation of the category name
        """
        return self.name


class Image(models.Model):
    """ Image class
    """
    title = models.CharField(max_length=255)
    description = models.TextField(blank=True, null=True)
    url = models.URLField(max_length=1000)
    image = models.ImageField(upload_to='images/')
    thumbnail = ImageSpecField(
        source='image',
        processors=[resize.ResizeToFit(500, 500)],
        format='JPEG',
        options={'quality': 70}
    )
    photographer = models.ForeignKey(
        "Photographer", related_name="images", on_delete=models.CASCADE
    )
    categories = models.ManyToManyField(Category, related_name="images")
    created_at = models.DateTimeField(default=timezone.now)

    def __str__(self) -> str:
        """ Returns the string representation of the image title
        """
        return self.title

    @property
    def filename(self):
        return os.path.basename(self.image.name)


class Photographer(models.Model):
    """ Photographer class
    """
    name = models.CharField(max_length=255)
    bio = models.TextField(blank=True, null=True)
    email = models.EmailField(unique=True)
    phone = models.CharField(max_length=20, blank=True, null=True)

    def __str__(self) -> str:
        """ Returns the string representation of the photographer's name
        """
        return self.name


class ContactForm(forms.Form):
    """ Contact form for bookings
    """
    name = forms.CharField(max_length=100)
    email = forms.EmailField()
    message = forms.CharField(widget=forms.Textarea)
