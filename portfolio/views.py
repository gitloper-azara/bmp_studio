from django.shortcuts import render
from .models import Image, Category


def index(request):
    """ Index route for website
    """
    images = Image.objects.all()
    return render(request, "index.html", {"images": images})


def portfolio(request, category_id):
    """ Portoflio route for displaying images
    """
    images = Image.objects.all()
    portrait_images = Image.objects.filter(category__id=category_id)
    return render(request, "portfolio/portfolio.html", {"images": images, "portrait_images": portrait_images})


def portfolio_portrait(request, category_id):
    """ Route for all portrait images

    Queries images related to a specific category using the category_id
    """
    portrait_images = Image.objects.filter(category__id=category_id)
    return render(request, "portfolio/portrait.html", {"images": portrait_images})


def portfolio_products(request):
    return render(request, "portfolio/product.html")


def portfolio_weddings(request):
    return render(request, "portfolio/weddings.html")


def portfolio_food(request):
    return render(request, "portfolio/food.html")


def about(request):
    return render(request, "about.html")


def contact(request):
    return render(request, "contact.html")


def videos(request):
    return render(request, "videos.html")


def blogs(request):
    return render(request, "blog.html")
