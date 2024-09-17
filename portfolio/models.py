""" Models module for MySQL
"""
import os
from django.db import models
from django.contrib.auth.models import User
from django.utils import timezone
from django import forms
from imagekit.models import ImageSpecField
from imagekit.processors import resize
from PIL import Image as PILImage
import os


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
    client = models.ManyToManyField(User, related_name="client_images", blank=True)
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
    width = models.PositiveIntegerField(null=True, blank=True)
    height = models.PositiveIntegerField(null=True, blank=True)
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

    def save(self, *args, **kwargs):
        """"""
        super().save(*args, **kwargs)
        if self.image and not self.width and not self.height:
            with PILImage.open(self.image.path) as img:
                self.width, self.height = img.size
                super().save(update_fields=['width', 'height'])


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


class Video(models.Model):
    """ Video class
    """
    title = models.CharField(max_length=255)
    description = models.TextField(blank=True, null=True)
    url = models.URLField(max_length=1000)
    thumbnail = models.ImageField(upload_to="video_thumbnails/", blank=True, null=True)
    photographer = models.ForeignKey(Photographer, related_name="videos", on_delete=models.CASCADE)
    created_at = models.DateTimeField(default=timezone.now)

    def __str__(self):
        """ Return string representation of Video class
        """
        return self.title
