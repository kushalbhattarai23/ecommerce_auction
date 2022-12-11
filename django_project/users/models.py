from django.db import models
from django.contrib.auth.models import User

from django.utils import timezone
from website.models import Product


class Profile(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    billingName = models.CharField(max_length=250, blank=True)
    billingAddress1 = models.CharField(max_length=250, blank=True)
    billingCity = models.CharField(max_length=250, blank=True)
    billingPostcode = models.CharField(max_length=250, blank=True)
    billingCountry = models.CharField(max_length=250, blank=True, default='Nepal')

    def __str__(self):
        return f'{self.user.username} Profile'


class Conversation(models.Model):
    created = models.DateTimeField(default=timezone.now)
    user_name = models.ForeignKey(User, on_delete=models.CASCADE)
    product_id = models.ForeignKey(Product, on_delete=models.CASCADE)
    convo = models.CharField(max_length=300, default="")


class Notify(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    message = models.CharField(max_length=500, default="This notification is send to you by default.")
    viewed = models.BooleanField(default=False)
    product = models.ForeignKey(Product, null=True, blank=True, on_delete=models.CASCADE)

    class Meta:
        verbose_name_plural = "Notifications"

class History(models.Model):
    created = models.DateTimeField(default=timezone.now)
    user_name = models.ForeignKey(User, on_delete=models.CASCADE)
    product_id = models.ForeignKey(Product, on_delete=models.CASCADE)

    class Meta:
        verbose_name_plural = "History"

class Favourites(models.Model):
    created = models.DateTimeField(default=timezone.now)
    user_name = models.ForeignKey(User, on_delete=models.CASCADE)
    product_id = models.ForeignKey(Product, on_delete=models.CASCADE)

    class Meta:
        verbose_name_plural = "Favourites"

class Dispute(models.Model):
    user_name = models.ForeignKey(User, on_delete=models.CASCADE)
    product_id = models.ForeignKey(Product, on_delete=models.CASCADE)
    created = models.DateTimeField(default=timezone.now)
    dispute = models.CharField(max_length=1000)
    solved = models.BooleanField(default=False)
