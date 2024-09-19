from django.urls import path
from django.contrib.auth.decorators import login_required
from django.contrib.auth.views import LogoutView
from rest_framework_simplejwt.views import (
    TokenObtainPairView,
    TokenRefreshView,
)
from . import views


urlpatterns = [
    path("", views.index, name="index"),
    path("portfolio/", views.portfolio, name="portfolio"),
    path(
        "portfolio/<int:category_id>/", views.portfolio_by_category,
        name="portfolio_by_category"
    ),
    path('videos/', views.videos, name="videos"),
    path('contact/', views.contact, name="contact"),
    path('about/', views.about, name="about"),
    path('blogs/', views.blogs, name="blogs"),

    # user authentication routes
    path("user-login/", views.UserLoginView.as_view(), name="user-login"),
    path(
        "register-user/", views.UserRegisterView.as_view(),
        name="register-user"
    ),
    path(
        "register/", views.UserRegistrationView.as_view(), name="register"
    ),
    path("login/", views.LoginView.as_view(), name="login"),
    path(
        "token/refresh/", TokenRefreshView.as_view(), name="token_refresh"
    ),
    path("logout/", LogoutView.as_view(next_page="index"), name="logout"),

    # user dashboard
    path(
        "dashboard/", login_required(views.UserDashboardView.as_view()),
        name="dashboard"
    ),
    path(
        "images/delete/<int:id>/", views.DeleteImageView.as_view(),
        name="delete_image"
    ),

    # api endpoints
    path(
        "api/images", views.ImageListAPIView.as_view(), name="image-list"
    ),
    path(
        "api/images/<int:pk>/", views.ImageDetailAPIView.as_view(),
        name="image-detail"
    ),
    path(
        "api/verify-token/", views.VerifyToken.as_view(),
        name="verify-token"
    ),
]
