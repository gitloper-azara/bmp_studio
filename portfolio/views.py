from django.shortcuts import render


def index(request):
    return render(request, "index.html")


def portfolio(request):
    return render(request, "portfolio/portfolio.html")


def portfolio_portrait(request):
    return render(request, "portfolio/portrait.html")


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
