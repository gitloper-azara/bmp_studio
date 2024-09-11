from django.urls import path
from . import views


urlpatterns = [
    path("", views.index, name="index"),
    path("portfolio/", views.portfolio, name="portfolio"),
    path("portfolio/<int:category_id>/", views.portfolio_by_category, name="portfolio_by_category"),
    path('portfolio/portraits/<int:category_id>/', views.portfolio_portrait, name="portfolio_portraits"),
    path('portfolio/products/', views.portfolio_products, name="portfolio_products"),
    path('portfolio/weddings/', views.portfolio_weddings, name="portfolio_weddings"),
    path('portfolio/food/', views.portfolio_food, name="portfolio_food"),
    path('videos/', views.videos, name="videos"),
    path('contact/', views.contact, name="contact"),
    path('about/', views.about, name="about"),
    path('blogs/', views.blogs, name="blogs"),
]
