from django.contrib.auth.models import User
from django.db import models
from time import time
from django.utils import timezone

from django.core.validators import RegexValidator



def getImage(instance, filename):
    return "auction_system/image_{0}_{1}".format(str(time()), filename)


class Product(models.Model):
    product_name = models.CharField(max_length=100)
    image = models.ImageField(upload_to=getImage)
    image2 = models.ImageField(upload_to=getImage, null=True, blank=True)
    image3 = models.ImageField(upload_to=getImage, null=True, blank=True)

    cat = (('Beauty Products', 'Beauty Products'),
           ('Vehicles', 'Vehicles'),
           ('Computer Peripherals', 'Computer Peripherals'),
           ('Electronics', 'Electronics'),
           ('Home Appliances', 'Home Appliances'),
           ('Mobile & Accessories', 'Mobile & Accessories'),
           ('Sport Items', 'Sport Items'),
           ('Games', 'Games'),
           ('Others', 'Others')
           )
    category = models.CharField(max_length=100, choices=cat, default='')
    description = models.TextField(max_length=300, default="")
    minimum_price = models.IntegerField(null=True)
    stock = models.IntegerField(null=True, default=1)
    STATUS = (
        ('auction', 'Auction Product'),
        ('shop', 'Shop Product')
    )
    status = models.CharField(
        max_length=32,
        choices=STATUS,
        default=''
    )
    purchased = models.BooleanField(default=False)
    expired = models.BooleanField(default=False)
    winner = models.ForeignKey(User, on_delete=models.CASCADE, null=True, blank=True)
    bid_end_date = models.DateTimeField(null=True, blank=True)
    created = models.DateTimeField(default=timezone.now)
    updated = models.DateTimeField(default=timezone.now)


class Seller(models.Model):
    created = models.DateTimeField(default=timezone.now)
    updated = models.DateTimeField(default=timezone.now)
    user_name = models.ForeignKey(User, on_delete=models.CASCADE)
    product_id = models.ForeignKey(Product, on_delete=models.CASCADE)


class Bidder(models.Model):
    numeric = RegexValidator(r'^[0-9]*$', 'Only numerics are allowed.')
    bid_end_date = models.DateTimeField(null=True, blank=True)
    created = models.DateTimeField(default=timezone.now)
    updated = models.DateTimeField(default=timezone.now)
    user_name = models.ForeignKey(User, on_delete=models.CASCADE)
    product_id = models.ForeignKey(Product, on_delete=models.CASCADE)
    max_amount = models.IntegerField(null=True)
    bid_amount = models.IntegerField(null=True)
    wining = models.BooleanField(default=False)

    class Meta:
        ordering = ['-created']


class Cart(models.Model):
    cart_id = models.CharField(max_length=250, blank=True)
    user = models.ForeignKey(User, on_delete=models.CASCADE,null=True,blank=True)
    date_added = models.DateField(auto_now_add=True)

    class Meta:
        db_table = 'Cart'
        ordering = ['date_added']

    def __str__(self):
        return self.cart_id


class CartItem(models.Model):
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    cart = models.ForeignKey(Cart, on_delete=models.CASCADE)
    quantity = models.IntegerField()
    active = models.BooleanField(default=True)

    class Meta:
        db_table = 'CartItem'

    def sub_total(self):
        return self.product.minimum_price * self.quantity

    def __str__(self):
        return self.product


class Order(models.Model):
    token = models.CharField(max_length=250, blank=True)
    total = models.DecimalField(max_digits=10, decimal_places=2, verbose_name='USD Order Total', blank=True)
    user_name = models.ForeignKey(User, on_delete=models.CASCADE, null=True)
    emailAddress = models.EmailField(max_length=250, blank=True, verbose_name='Email Address')
    created = models.DateTimeField(auto_now_add=True)
    billingName = models.CharField(max_length=250, blank=True)
    billingAddress1 = models.CharField(max_length=250, blank=True)
    billingCity = models.CharField(max_length=250, blank=True)
    billingPostcode = models.CharField(max_length=250, blank=True)
    billingCountry = models.CharField(max_length=250, blank=True)
    shippingName = models.CharField(max_length=250, blank=True)
    shippingAddress1 = models.CharField(max_length=250, blank=True)
    shippingCity = models.CharField(max_length=250, blank=True)
    shippingPostcode = models.CharField(max_length=250, blank=True)
    shippingCountry = models.CharField(max_length=250, blank=True)

    class Meta:
        db_table = 'Order'
        ordering = ['-created']

    def __str__(self):
        return str(self.id)


class OrderItem(models.Model):
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    quantity = models.IntegerField()
    price = models.DecimalField(max_digits=10, decimal_places=2, verbose_name='USD Price')
    order = models.ForeignKey(Order, on_delete=models.CASCADE)

    class Meta:
        db_table = 'OrderItem'

    def sub_total(self):
        return self.quantity * self.price


