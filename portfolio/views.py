from django.shortcuts import render
from django.core.mail import send_mail
from .models import Image, Category, ContactForm


def index(request):
    """ Index route for website
    """
    images = Image.objects.select_related('photographer').order_by("-created_at")
    return render(request, "index.html", {"images": images})


def portfolio(request):
    """ Portoflio route for displaying images
    """
    categories = Category.objects.all()
    images = Image.objects.select_related('photographer').order_by("-created_at")

    return render(request, "portfolio/portfolio.html", {
        "images": images,
        "categories": categories
    })


def portfolio_by_category(request, category_id=None):
    """ Portoflio route for displaying images
    """
    categories = Category.objects.all()
    images = Image.objects.all().select_related('photographer').order_by("-created_at")

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
    """ Contact route
    """
    if request.method == "POST":
        form = ContactForm(request.POST)
        if form.is_valid():
            send_mail(
                f"Message from {form.cleaned_data['name']}",
                form.cleaned_data['message'],
                form.cleaned_data['email'],
                [
                    'brothersmediaproduction@gmail.com',
                    'yyushahu@gmail.com',
                    'iddibobo@gmail.com'
                ]
            )
            return render(request, 'thanks.html')
    else:
        form = ContactForm()
    return render(request, "contact.html", {'form': form})


def videos(request):
    return render(request, "videos.html")


def blogs(request):
    return render(request, "blog.html")
