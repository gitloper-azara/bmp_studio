""" Models module for MySQL
"""
import os
from django.db import models
from django.utils import timezone


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
