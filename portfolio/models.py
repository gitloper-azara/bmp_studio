""" Models module for MySQL
"""
import os
from django.db import models
from django.contrib.auth.models import User
from django.core.files import File
from django.utils import timezone
from django import forms
from imagekit.models import ImageSpecField
from imagekit.processors import resize
from PIL import Image as PILImage
import json
import tempfile
import subprocess
from io import BytesIO


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

    IMGIX_DOMAIN = 'bmpstudio.imgix.net'

    client = models.ManyToManyField(
        User, related_name="client_images", blank=True
    )
    title = models.CharField(max_length=255)
    description = models.TextField(blank=True, null=True)
    image = models.ImageField(upload_to='images/')
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
        """ Returns the final component (file name) of an image
        """
        return os.path.basename(self.image.name)

    DOMAIN = f'https://{IMGIX_DOMAIN}/'

    @property
    def optimized_image_url(self) -> str:
        """ Return optimized image URL from Imgix
        """
        domain_url = self.DOMAIN + f'{self.image.name}'
        return domain_url + '?auto=format,compress,enhance'

    @property
    def srcset_image_url(self) -> str:
        """ Generate srcset for images with multiple device pixel ratios
        """
        domain_url = self.DOMAIN + f'{self.image.name}'
        base_url = domain_url + '?auto=format,compress,enhance'
        dpr_1 = f'{base_url}&dpr=1 1x, '
        dpr_2 = f'{base_url}&dpr=2 2x, '
        dpr_3 = f'{base_url}&dpr=3 3x'
        return dpr_1 + dpr_2 + dpr_3

    @property
    def optimized_thumbnail_url(self) -> str:
        """ Return optimized thumbnail URL from imgix
        """
        domain_url = self.DOMAIN + f'{self.image.name}'
        query_param = '?w=500&h=500&fit=max&auto=format,enhance&q=90'
        return domain_url + query_param

    @property
    def srcset_thumbnail_url(self) -> str:
        """ Generate srcset for thumbnails with multiple device pixel ratios
        """
        domain_url = self.DOMAIN + f'{self.image.name}'
        query_param = '?w=500&h=500&fit=max&auto=format,enhance&q=90'
        base_url = domain_url + query_param
        dpr_1 = f'{base_url}&dpr=1 1x, '
        dpr_2 = f'{base_url}&dpr=2 2x, '
        dpr_3 = f'{base_url}&dpr=3 3x'
        return dpr_1 + dpr_2 + dpr_3

    def save(self, *args, **kwargs) -> None:
        """ Overide save to include width and height retrieval on save
        """
        super().save(*args, **kwargs)
        if self.image and not self.width and not self.height:
            # open image from file-like object (use case for GCS)
            image_file = BytesIO(self.image.read())
            with PILImage.open(image_file) as img:
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
    video = models.FileField(upload_to="videos/", null=True, blank=True)
    thumbnail = models.ImageField(
        upload_to="video_thumbnails/", blank=True, null=True
    )
    thumbnail_small = ImageSpecField(
        source='thumbnail',
        processors=[resize.ResizeToFit(500, 500)],
        format='JPEG',
        options={'quality': 100}
    )
    width = models.PositiveIntegerField(null=True, blank=True)
    height = models.PositiveIntegerField(null=True, blank=True)
    duration = models.FloatField(null=True, blank=True)
    photographer = models.ForeignKey(
        Photographer, related_name="videos", on_delete=models.CASCADE
    )
    created_at = models.DateTimeField(default=timezone.now)

    def __str__(self) -> str:
        """ Return string representation of Video class
        """
        return self.title

    def save(self, *args, **kwargs) -> None:
        """ Save instance method to save video files
        """
        super().save(*args, **kwargs)
        if not self.thumbnail:
            self.create_thumbnail()
        if not self.width or not self.height or not self.duration:
            self.set_video_attributes()

    def create_thumbnail(self) -> None:
        """ Thumbnail generator
        """
        if not self.video:
            return

        temp_dir = tempfile.mkdtemp()
        temp_thumbnail = os.path.join(temp_dir, 'thumb.jpg')

        try:
            # Construct FFmpeg command
            ffmpeg_command = [
                'ffmpeg', '-i', self.video.path,
                '-ss', '00:00:10', '-vframes', '1',
                '-vf', 'scale=480:-1', temp_thumbnail
            ]
            result = subprocess.run(
                ffmpeg_command, check=True, stderr=subprocess.PIPE
            )

            with PILImage.open(temp_thumbnail) as img:
                img.thumbnail((480, 480))
                img.save(temp_thumbnail, "JPEG")

            with open(temp_thumbnail, 'rb') as f:
                self.thumbnail.save(
                    f'{self.title}_thumbnail.jpg', File(f), save=True
                )

        except subprocess.CalledProcessError as e:
            print(f'FFmpeg error: {e.stderr}')
        except Exception as e:
            print(f'Unexpected error in create_thumbnail: {str(e)}')
        finally:
            if os.path.exists(temp_thumbnail):
                os.remove(temp_thumbnail)
            os.rmdir(temp_dir)

    def set_video_attributes(self) -> None:
        """ Set video attributes on save
        """
        if not self.video:
            return

        try:
            probe = subprocess.check_output([
                'ffprobe',
                '-v', 'quiet',
                '-print_format', 'json',
                '-show_format', '-show_streams',
                self.video.path
            ])
            probe_data = json.loads(probe)

            video_stream = next(
                s for s in probe_data['streams']
                if s['codec_type'] == 'video'
            )
            self.width = int(video_stream['width'])
            self.height = int(video_stream['height'])
            self.duration = float(probe_data['format']['duration'])

            self.save()
        except Exception as e:
            print(f'Error setting video attributes: {e}')
