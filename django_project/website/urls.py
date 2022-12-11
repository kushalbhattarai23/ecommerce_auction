from django.urls import include
from django.views.generic import TemplateView

from website import classviews
from . import views
from django.conf.urls import url
import website.views
from .classviews import *
from django.contrib.auth.decorators import login_required
from users import views as user_views

urlpatterns = [
    url(r'^$', views.home, name="website-home"),
    url(r'^home', views.home, name="home"),
    url(r'^notification/', login_required(user_views.showNotifiy), name='viewnotify'),
    url(r'^viewed/(?P<pk>\d+)/', login_required(user_views.deleteNotifiy), name='deletenotify'),
    url(r'^expire', views.expiredHome, name="expired"),
    url(r'^shop', views.shop, name="shop"),
    url(r'^auction', views.auction, name="auction"),
    url(r'^about', views.about, name="website-about"),
    url(r'^message/', login_required(views.message), name="message"),
    url(r'^myuploadedproducts/', views.myproducts, name="all-product"),
    url(r'^adduactionproduct/', login_required(AddProductView.as_view()), name="post-create"),
    url(r'^addshopproduct/', login_required(AddShopProductView.as_view()), name="shopcreate"),
    url(r'^productdetails/(?P<pk>[0-9]+)', ProductDetailView.as_view(), name="product_detail"),
    url(r'^updateauction/(?P<pk>[0-9]+)', login_required(classviews.ProductUpdateView.as_view()), name="update"),
    url(r'^updateshop/(?P<pk>[0-9]+)', login_required(classviews.ShopProductUpdateView.as_view()), name="updateshop"),
    url(r'^addTime/(?P<pk>[0-9]+)', login_required(views.addTime), name="addtime"),
    url(r'^savebid/', login_required(website.views.save_bid), name="save_bid"),
    url(r'^search/', views.searchResult, name='search'),
    url(r'^cart/(?P<pk>[0-9]+)', login_required(views.add_cart), name='add_cart'),
    url(r'^cart/', login_required(views.cart_detail), name='cart'),
    url(r'^cartremove/(?P<pk>[0-9]+)', login_required(views.cart_remove), name='cart_remove'),
    url(r'^order-history/', login_required(views.orderHistory), name='order_history'),
    url(r'^createorder/', login_required(views.createOrder2), name='makeorder'),
    url(r'^createcashshoporder/', login_required(views.createCashShopOrder), name='shopcashorder'),
    url(r'^order/(?P<pk>[0-9]+)', login_required(views.viewOrder), name='order'),
    url(r'^order/(?P<pk>[0-9]+)', login_required(views.viewOrder), name='order_detail'),
    url(r'^sellerdashboard/', login_required(website.views.selldashboard), name='sellDashboard'),
    url(r'^thanks/(?P<pk>[0-9]+)', login_required(views.thanks_page), name='thanks_page'),
    url(r'^history/', login_required(views.history), name='history'),
    url(r'^favourites/', login_required(views.favourite), name='favourites'),
    url(r'^addfavourites/', login_required(views.addFavourite), name='addfavourite'),
    url(r'^mybids/', login_required(views.myBids), name='mybids'),
    url(r'^won/', login_required(views.won), name='won'),
    url(r'^winner/', login_required(views.winner), name='winner'),
    url(r'^winning/', login_required(views.winning), name='winning'),
    url(r'^dispute/', login_required(views.fileDispute), name='filedispute'),
    url(r'^end/(?P<pk>[0-9]+)', login_required(views.end), name='end'),

]
