""" Serializer to convert data, such as querysets into JSON
and vice versa
"""
from rest_framework import serializers
from .models import Image
from django.contrib.auth.models import User


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


class UserRegistrationSerializer(serializers.ModelSerializer):
    """ User registration serializer that handles user registration,
    and hashing passwords securely.
    """
    password = serializers.CharField(write_only=True)

    class Meta:
        """ Meta class
        """
        model = User
        fields = ["username", "password", "email"]

    def create(self, validated_data):
        """ create method that creates a new user with hashed pwd
        """
        user = User.objects.create_user(
            username=validated_data['username'],
            email=validated_data['email'],
            password=validated_data['password'],
        )
        return user
