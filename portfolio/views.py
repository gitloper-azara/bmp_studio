from django.shortcuts import render
from .models import Image, Category


def index(request):
    """ Index route for website
    """
    images = Image.objects.all().order_by("-created_at")
    return render(request, "index.html", {"images": images})


def portfolio(request):
    """ Portoflio route for displaying images
    """
    categories = Category.objects.all()
    images = Image.objects.order_by("-created_at")

    return render(request, "portfolio/portfolio.html", {
        "images": images,
        "categories": categories
    })


def portfolio_by_category(request, category_id=None):
    """ Portoflio route for displaying images
    """
    categories = Category.objects.all()
    images = Image.objects.all().order_by("-created_at")

    # optionally filter images by category if a category_id is given
    if category_id:
        images = Image.objects.filter(categories__id=category_id).order_by("-created_at")
        selected_category = Category.objects.get(id=category_id)

    return render(request, "portfolio/portfolio.html", {
        "images": images,
        "categories": categories,
        "selected_category": selected_category
    })


def about(request):
    return render(request, "about.html")


def contact(request):
    return render(request, "contact.html")


def videos(request):
    return render(request, "videos.html")


def blogs(request):
    return render(request, "blog.html")
