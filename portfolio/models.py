""" Models module for MySQL
"""
import os
from django.db import models
from django.contrib.auth.models import User
from django.core.files import File
from django.conf import settings
from django.utils import timezone
from django import forms
from imagekit.models import ImageSpecField
from imagekit.processors import resize
from PIL import Image as PILImage
import ffmpeg
import tempfile
import subprocess
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
    video = models.FileField(upload_to="videos/", null=True, blank=True)
    thumbnail = models.ImageField(upload_to="video_thumbnails/", blank=True, null=True)
    thumbnail_small = ImageSpecField(
        source='thumbnail',
        processors=[resize.ResizeToFit(500, 500)],
        format='JPEG',
        options={'quality': 70}
    )
    width = models.PositiveIntegerField(null=True, blank=True)
    height = models.PositiveIntegerField(null=True, blank=True)
    duration = models.FloatField(null=True, blank=True)
    photographer = models.ForeignKey(Photographer, related_name="videos", on_delete=models.CASCADE)
    created_at = models.DateTimeField(default=timezone.now)

    def __str__(self):
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

    def create_thumbnail(self):
        """ Thumbnail generator
        """
        print("Entering create_thumbnail method")
        if not self.video:
            print("No video file found")
            return

        temp_dir = tempfile.mkdtemp()
        temp_thumbnail = os.path.join(temp_dir, 'thumb.jpg')

        try:
            print(f"Attempting to create thumbnail from video: {self.video.path}")
            # Construct FFmpeg command
            ffmpeg_command = [
                'ffmpeg', '-i', self.video.path, '-ss', '00:00:10', '-vframes', '1',
                '-vf', 'scale=480:-1', temp_thumbnail
            ]
            print(f"Running FFmpeg command: {' '.join(ffmpeg_command)}")
            result = subprocess.run(ffmpeg_command, check=True, stderr=subprocess.PIPE)
            print(f"FFmpeg command executed with result: {result}")

            with PILImage.open(temp_thumbnail) as img:
                img.thumbnail((480, 480))
                img.save(temp_thumbnail, "JPEG")

            with open(temp_thumbnail, 'rb') as f:
                self.thumbnail.save(f'{self.title}_thumbnail.jpg', File(f), save=True)
            print("Thumbnail created successfully")

        except subprocess.CalledProcessError as e:
            print(f'FFmpeg error: {e.stderr}')
        except Exception as e:
            print(f'Unexpected error in create_thumbnail: {str(e)}')
        finally:
            if os.path.exists(temp_thumbnail):
                os.remove(temp_thumbnail)
            os.rmdir(temp_dir)

    def set_video_attributes(self):
        """ Set video attributes on save
        """
        if not self.video:
            return

        try:
            probe = subprocess.check_output([
                'ffprobe',
                '-v', 'quite',
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
