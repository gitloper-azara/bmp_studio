from django.core.management.base import BaseCommand
from portfolio.models import Image
from PIL import Image as PILImage


class Command(BaseCommand):
    """ Command class
    """

    help = 'Populate width and height for exisiting images'

    def handle(self, *args, **kwargs):
        images = Image.objects.filter(
            width__isnull=True, height__isnull=True
        )
        for img in images:
            with PILImage.open(img.image.path) as pil_img:
                img.width, img.height = pil_img.size
                img.save()
        self.stdout.write(
            self.style.SUCCESS(
                f"Successfully updated {images.count()} images"
            )
        )
