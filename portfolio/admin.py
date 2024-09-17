from django.contrib import admin
from .models import Image, Category, Photographer, Video


admin.site.register(Image)
admin.site.register(Category)
admin.site.register(Photographer)
admin.site.register(Video)
