"""django_project URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('website/', include('website.urls'))
"""
from django.contrib import admin

from django.conf.urls import url,include

from django.contrib.auth import views as auth_views
from django.urls import path
from django.conf import settings
from django.conf.urls.static import static
from users import views as user_views
import website.views as v

urlpatterns = [
    path('admin/', admin.site.urls,name='super'),
    path('register/', user_views.register, name='register'),
    path('verifylogin/', user_views.verifyLogin, name='vlogin'),
    path('profile/', user_views.profile, name='profile'),
    path('login/', auth_views.LoginView.as_view(template_name='users/login.html',redirect_authenticated_user=True),name='login'),
    path('logout/', v.logout, name='logout'),

    path('user/', include('users.urls')),
    path('', include('website.urls')),
    path('', include('users.urls')),
]

if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
