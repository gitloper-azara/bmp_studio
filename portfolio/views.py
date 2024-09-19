from typing import Any
from django.http.response import HttpResponse
from django.shortcuts import render, get_object_or_404, redirect
from django.core.mail import send_mail
from .models import Image, Category, ContactForm, Video
from rest_framework import generics, status, views
from .serializers import ImageSerializer, UserRegistrationSerializer
from django.contrib import messages
from django.contrib.auth import authenticate, login, get_user_model
from django.contrib.auth.models import User
from django.http import HttpRequest, JsonResponse
from django.views import View
from rest_framework.views import APIView
from rest_framework.permissions import (
    AllowAny, IsAuthenticated, IsAdminUser
)
from rest_framework.decorators import (
    authentication_classes, permission_classes
)
from rest_framework.response import Response
from rest_framework_simplejwt.tokens import RefreshToken, AccessToken
from rest_framework_simplejwt.authentication import JWTAuthentication
from rest_framework_simplejwt.views import TokenObtainPairView
from django.views.generic import TemplateView
from django.contrib.auth.decorators import login_required
from django.contrib.auth.mixins import LoginRequiredMixin
from django.utils.decorators import method_decorator
from django.middleware.csrf import get_token
from django.core.paginator import Paginator


class ImageListAPIView(generics.ListCreateAPIView):
    """ Image List API View class
    """
    queryset = Image.objects.all().order_by("-created_at")
    serializer_class = ImageSerializer
    permission_classes = [IsAuthenticated, IsAdminUser]


class ImageDetailAPIView(generics.RetrieveUpdateDestroyAPIView):
    """ Image Detail API View
    """
    queryset = Image.objects.all()
    serializer_class = ImageSerializer
    permission_classes = [IsAuthenticated, IsAdminUser]


class UserRegistrationView(generics.CreateAPIView):
    """ User registration view
    """
    queryset = User.objects.all()
    permission_classes = (AllowAny,)
    serializer_class = UserRegistrationSerializer

    def post(self, request, *args, **kwargs):
        """ handle new user creation post request
        """
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        user = serializer.save()

        # generate tokens here
        refresh = RefreshToken.for_user(user=user)
        return Response({
            "refresh": str(refresh),
            "access": str(refresh.access_token),
        }, status=status.HTTP_201_CREATED)


class LoginView(View):
    """ Custom login view for handling API requests
    """
    def post(self, request):
        """ Handle POST login requests
        """
        username = request.POST.get('username')
        password = request.POST.get('password')
        user = authenticate(username=username, password=password)
        if user:
            # log the user in by creating a session
            login(request, user)
            # use JWT auth after logging in
            view = TokenObtainPairView.as_view()
            response = view(request)
            if response.status_code == 200:
                response_data = response.data
                response_data['user_id'] = user.id
                return JsonResponse(response_data)
        return JsonResponse(
            {"error": "Invalid credentials"}, status=400
        )

    def get(self, request):
        """ Handle GET requests, returns a CSRF token
        """
        csrf_token = get_token(request)
        return JsonResponse({"csrf_token": csrf_token})


class VerifyToken(APIView):
    """ Token verification view
    """
    permission_classes = [IsAuthenticated]

    def post(self, request):
        """ Handle POST request for token verification
        """
        token = request.auth
        user_id = request.data.get('user_id')

        if not token or not user_id:
            return Response(
                {"is_valid": False, "error": "Invalid request"}, status=400
            )

        try:
            # verify that the token belongs to the claiming user
            token_user = AccessToken(token).payload.get('user_id')
            if int(token_user) != int(user_id):
                raise ValueError("Token does not match user")

            # verify that the user exists
            User = get_user_model()
            user = User.objects.get(id=user_id)

            return Response({"is_valid": True, "username": user.username})
        except (ValueError, User.DoesNotExist):
            return Response(
                {"is_valid": False, "error": "Invalid request"}, status=400
            )


class UserLoginView(TemplateView):
    """ Custom user login page
    """
    template_name = "login.html"

    def dispatch(
            self, request: HttpRequest, *args: Any, **kwargs: Any
    ) -> HttpResponse:
        """ Redirect user to dashboard if already authenticated
        """
        if request.user.is_authenticated:
            return redirect('dashboard')
        return super().dispatch(request, *args, **kwargs)


class UserRegisterView(TemplateView):
    """ Custome user registeration view
    """
    template_name = "register.html"


@method_decorator(
    login_required(login_url='/user-login/'), name='dispatch'
)
@authentication_classes([JWTAuthentication])
@permission_classes([IsAuthenticated])
class UserDashboardView(LoginRequiredMixin, TemplateView):
    """ User dashboard view that displays images for the logged-in client
    """
    template_name = "dashboard/dashboard.html"

    def get_context_data(self, **kwargs: Any) -> "dict[str, Any]":
        """ Get context data
        """
        context = super().get_context_data(**kwargs)

        # get logged-in user
        user = self.request.user

        # retrieve images related to the logged-in user
        context['images'] = user.client_images.order_by("-created_at")
        return context


class DeleteImageView(LoginRequiredMixin, View):
    """ Delete image functionality for authenticated users
    """
    def post(self, request, id):
        """ post request with an image id
        """
        image = get_object_or_404(Image, id=id, user=request.user)

        image.delete()
        messages.success(request, "Image deleted successfully.")

        return redirect("dashboard")


def index(request):
    """ Index route for website
    """
    image_list = Image.objects.select_related('photographer').order_by(
        "-created_at"
    )

    # implement pagination: 40 images per page
    paginator = Paginator(image_list, 40)
    page_number = request.GET.get('page')
    images = paginator.get_page(page_number)

    return render(request, "index.html", {"images": images})


def portfolio(request):
    """ Portoflio route for displaying images
    """
    categories = Category.objects.all()
    image_list = Image.objects.select_related('photographer').order_by(
        "-created_at"
    )

    # implement pagination: 40 images per page
    paginator = Paginator(image_list, 40)
    page_number = request.GET.get('page')
    images = paginator.get_page(page_number)

    return render(request, "portfolio/portfolio.html", {
        "images": images,
        "categories": categories
    })


def portfolio_by_category(request, category_id=None):
    """ Portoflio route for displaying images
    """
    categories = Category.objects.all()
    image_list = Image.objects.all().select_related('photographer').order_by(
        "-created_at"
    )

    # optionally filter images by category if a category_id is given
    if category_id:
        image_list = Image.objects.filter(
            categories__id=category_id
        ).order_by("-created_at")
        selected_category = Category.objects.get(id=category_id)

    # implement pagination: 40 images per page
    paginator = Paginator(image_list, 40)
    page_number = request.GET.get('page')
    images = paginator.get_page(page_number)

    return render(request, "portfolio/portfolio.html", {
        "images": images,
        "categories": categories,
        "selected_category": selected_category if category_id else None
    })


def about(request):
    """ Renders and displays the about section of the website
    """
    return render(request, "about.html")


def contact(request):
    """ Contact route
    """
    if request.method == "POST":
        form = ContactForm(request.POST)
        if form.is_valid():
            send_mail(
                f"Message from {form.cleaned_data['name']} "
                f"on BMP Studio's Website",
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
    """ route for videos
    """
    videos = Video.objects.all().order_by("-created_at")
    return render(request, "videos.html", {"videos": videos})


def blogs(request):
    """ Renders and returns the blog section of the website
    """
    return render(request, "blog.html")
