from django.conf.urls import url
from django.contrib.admin import AdminSite
from django.contrib.auth import views as auth_views
from django.contrib.auth.decorators import login_required
from django.urls import path
from django.conf import settings
from django.conf.urls.static import static
from users import views as user_views
urlpatterns = [

    url(r'^updateProfile/(?P<pk>[0-9]+)/', user_views.ProfileUpdateView.as_view(), name='updateAcc'),

    url(r'^admin-dashboard', user_views.adminAnalytics, name="admin-home"),
    path('password-reset/',
         auth_views.PasswordResetView.as_view(
             template_name='users/commonFile/password_reset.html'
         ),
         name='password_reset'),
    path('password-reset/done/',
         auth_views.PasswordResetDoneView.as_view(
             template_name='users/commonFile/password_reset_done.html'
         ),
         name='password_reset_done'),
    path('password-reset-confirm/<uidb64>/<token>/',
         auth_views.PasswordResetConfirmView.as_view(
             template_name='users/commonFile/password_reset_confirm.html'
         ),
         name='password_reset_confirm'),
    path('password-reset-complete/',
         auth_views.PasswordResetCompleteView.as_view(
             template_name='users/commonFile/profile.html'
         ),
         name='password_reset_complete'),
]

if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
AdminSite.site_header = "SG | Admin"
AdminSite.site_title = "SG SUPER ADMIN PORTAL"
AdminSite.index_title = "WELCOME TO SAMANGHAR SUPER ADMIN PANEL"
