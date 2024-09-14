""" Serializer to convert data, such as querysets into JSON
and vice versa
"""
from rest_framework import serializers
from .models import Image


class ImageSerializer(serializers.ModelSerializer):
    """ Image Serializer class
    """
    class Meta:
        """ Meta class
        """
        model = Image
        fields = [
            "id",
            "title",
            "description",
            "url",
            "image",
            "thumbnail",
            "width",
            "height",
            "photographer",
            "categories",
            "created_at"
        ]

    image = serializers.ImageField(use_url=True)
    thumbnail = serializers.ImageField(use_url=True)
