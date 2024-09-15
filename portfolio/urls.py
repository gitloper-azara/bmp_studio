from django.urls import path
from rest_framework_simplejwt.views import (
    TokenObtainPairView,
    TokenRefreshView,
)
from . import views


urlpatterns = [
    path("", views.index, name="index"),
    path("portfolio/", views.portfolio, name="portfolio"),
    path("portfolio/<int:category_id>/", views.portfolio_by_category, name="portfolio_by_category"),
    path('videos/', views.videos, name="videos"),
    path('contact/', views.contact, name="contact"),
    path('about/', views.about, name="about"),
    path('blogs/', views.blogs, name="blogs"),

    # user authentication routes
    path("register/", views.UserRegistrationView.as_view(), name="register"),
    path("login/", TokenObtainPairView.as_view(), name="login"),
    path("token/refresh/", TokenRefreshView.as_view(), name="token_refresh"),

    # api endpoints
    path("api/images", views.ImageListAPIView.as_view(), name="image-list"),
    path("api/images/<int:pk>/", views.ImageDetailAPIView.as_view(), name="image-detail")
]
