from django import forms
from django.contrib.auth.models import User
from django.contrib.auth.forms import UserCreationForm

from users.models import Profile


class UserRegisterForm(UserCreationForm):
    email = forms.EmailField()
    role = forms.ChoiceField(choices=(('User', 'User'), ('Admin', 'Admin'), ('SuperAdmin', 'SuperAdmin')))

    class Meta:
        model = User
        fields = ['username', 'first_name', 'last_name', 'email', 'password1', 'password2', 'role','is_staff']

class ProfileForm(forms.ModelForm):
    class Meta:
        model = Profile
        fields = '__all__'
