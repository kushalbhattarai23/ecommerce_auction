
from datetime import datetime, timedelta

import stripe
from django.conf import settings
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.contrib.auth.models import auth
from django.core.exceptions import ObjectDoesNotExist
from django.core.mail import send_mail
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.db.models import Q, Count
from django.http import JsonResponse
from django.shortcuts import *
from django.shortcuts import render_to_response
from django.utils.timezone import get_current_timezone

from users.models import *
from .models import *


def home(request):
    check()
    title = 'Home'
    if request.user.is_authenticated:

        notify = Notify.objects.filter(user=request.user)[:4]
        view = Notify.objects.filter(user=request.user, viewed=False).count()
        shop = Product.objects.filter(status='shop', purchased=False).order_by('id')[:4]
        auction = Product.objects.filter(status='auction', expired=False).order_by('id')[:4]
        context = {'shopposts': shop, 'auctionposts': auction, 'notifications': notify, 'unviewed': view,
                   'title': title}
        return render(request, 'website/home.html', context)
    else:
        shop = Product.objects.filter(status='shop', purchased=False).order_by('id')[:4]
        auction = Product.objects.filter(status='auction', expired=False).order_by('id')[:4]
        context = {'shopposts': shop, 'auctionposts': auction, 'title': title}
    return render(request, 'website/home.html', context)


def expiredHome(request):
    check()
    shop = Product.objects.filter(status='shop', purchased=True).order_by('id')[:4]
    auction = Product.objects.filter(status='auction', expired=True).order_by('id')[:4]
    if request.user.is_authenticated:
        notify = Notify.objects.filter(user=request.user)[:4]
        view = Notify.objects.filter(user=request.user, viewed=False).count()
        context = {'shopposts': shop, 'auctionposts': auction, 'notifications': notify, 'unviewed': view,
                   'title': 'Expired / Purchased'}
        return render(request, 'website/expiredhome.html', context)
    else:
        context = {'shopposts': shop, 'auctionposts': auction, 'title': 'Expired / Purchased'}
        return render(request, 'website/expiredhome.html', context)


def shop(request):
    check()

    shop = Product.objects.filter(status='shop', expired=False).order_by('id')
    page = request.GET.get('page', 1)
    paginator = Paginator(shop, 3)
    try:
        users = paginator.page(page)
    except PageNotAnInteger:
        users = paginator.page(1)
    except EmptyPage:
        users = paginator.page(paginator.num_pages)
    if request.user.is_authenticated:
        notify = Notify.objects.filter(user=request.user)[:4]
        view = Notify.objects.filter(user=request.user, viewed=False).count()
        return render(request, 'website/shop.html',
                      {'shopposts': users, 'notifications': notify, 'unviewed': view, 'title': 'SHOP'})
    else:
        return render(request, 'website/shop.html', {'shopposts': users, 'title': 'SHOP'})


def auction(request):
    check()
    auction = Product.objects.filter(status='auction').order_by('id')
    page = request.GET.get('page', 1)
    paginator = Paginator(auction, 4)
    try:
        products = paginator.page(page)
    except PageNotAnInteger:
        products = paginator.page(1)
    except EmptyPage:
        products = paginator.page(paginator.num_pages)

    if request.user.is_authenticated:
        notify = Notify.objects.filter(user=request.user)[:4]
        view = Notify.objects.filter(user=request.user, viewed=False).count()
        return render(request, 'website/auction.html',
                      {'auctionposts': products, 'notifications': notify, 'unviewed': view, 'title': 'AUCTION'})
    else:
        context = {'auctionposts': products, 'title': 'SHOP'}

        return render(request, 'website/auction.html', context)


def myBids(request):
    check()
    notify = Notify.objects.filter(user=request.user)[:4]
    view = Notify.objects.filter(user=request.user, viewed=False).count()
    users = Bidder.objects.filter(user_name=request.user)
    context = {'bidder_list': users, 'notifications': notify, 'unviewed': view, 'title': 'My Bids'}
    return render(request, 'website/mybids.html', context)


def won(request):
    check()
    notify = Notify.objects.filter(user=request.user)[:4]
    view = Notify.objects.filter(user=request.user, viewed=False).count()
    total = Product.objects.filter(status='auction', winner=request.user, purchased=False)
    subtotal = 0
    for each in total:
        subtotal += each.minimum_price
    print(subtotal)
    context = {
        'winning': Product.objects.filter(status='auction', winner=request.user,purchased=False),
        'profile': Profile.objects.get(user=request.user),
        'maxamount': subtotal,
        'notifications': notify, 'unviewed': view,
    }

    return render(request, 'website/won.html', context)


@login_required
def selldashboard(request):
    check()
    notify = Notify.objects.filter(user=request.user)[:4]
    view = Notify.objects.filter(user=request.user, viewed=False).count()
    context = {
        'users': User.objects.all(),
        'notifications': notify, 'unviewed': view,

    }

    return render(request, 'website/sellerdashboard.html', context)

def check():
    auctions = Product.objects.filter(status='auction')
    for auction in auctions:
        if auction.expired != True:
            if auction.bid_end_date < timezone.now():
                auction.expired = True
                bid = Bidder.objects.filter(product_id=auction.pk, wining=True).order_by('-bid_end_date')
                if bid:
                    latest_bid = bid[0]
                    auction.winner = latest_bid.user_name
                    auction.expired = True
                    auction.save()
                else:
                    auction.save()
            else:
                auction.save()

        if auction.expired == True:
            if auction.bid_end_date > timezone.now():
                auction.expired = False
                auction.save()


# category
def about(request):
    return render(request, 'website/about.html')


def logout(request):
    auth.logout(request)
    return redirect('website-home')


@login_required
def save_bid(request):

    if request.method == 'POST':
        check()
        if request.user.is_staff or request.user.is_superuser:
            messages.info(request, "You are and admin. You need to create a user account to bid")
            return HttpResponseRedirect(request.META.get('HTTP_REFERER', '/'))
        else:

            context = dict()
            context['product_list'] = Product.objects.get(id=request.POST.get('product_id'))
            context['seller'] = Seller.objects.get(product_id_id=request.POST.get('product_id'))
            selleruser = Seller.objects.get(product_id_id=request.POST.get('product_id')).user_name


            if int(request.POST['bid_amount']) <= Product.objects.get(id=request.POST['product_id']).minimum_price:
                messages.error(request, "bid amount is low")
                return HttpResponseRedirect(request.META.get('HTTP_REFERER', '/'))
            try:
                max = Bidder.objects.filter(product_id=request.POST.get('product_id')).first()
                if int(request.POST['bid_amount']) >= max.max_amount:
                    pass
                else:
                    messages.error(request, "bid amount must be higher than the latest bid")
                    return HttpResponseRedirect(request.META.get('HTTP_REFERER', '/'))
            except:
                pass
            x = Bidder.objects.filter(product_id=Product.objects.get(id=request.POST.get('product_id'))).values(
                'user_name')
            print(x)
            a = 0
            for item in x:
                print(type(item['user_name']))

                if item['user_name'] != request.user.id:
                    lose = Bidder.objects.get(user_name=item['user_name'],
                                              product_id=Product.objects.get(id=request.POST.get('product_id')))
                    lose.wining = False
                    losenotice = Notify.objects.create(message="You have a lost a bid",
                                                       user=lose.user_name,
                                                       product=Product.objects.get(id=request.POST.get('product_id')))
                    losenotice.save()
                    lose.save()

                if item['user_name'] == request.user.id:
                    y = Bidder.objects.get(user_name=request.user.id,
                                           product_id=Product.objects.get(id=request.POST.get('product_id')))
                    y.bid_amount = int(request.POST.get('bid_amount'))
                    y.max_amount = int(request.POST.get('bid_amount')) + 1
                    y.wining = True
                    y.save()

                    updatenotice = Notify.objects.create(message="You have a new bid amount for your products",
                                                         user=selleruser,
                                                         product=Product.objects.get(id=request.POST.get('product_id')))
                    print(updatenotice)
                    updatenotice.save()
                    messages.success(request, "bid amount is changed.You are the current highest bidder")
                    a = 1

            if not a:
                obj = Bidder(user_name=request.user, product_id=Product.objects.get(id=request.POST.get('product_id')),
                             bid_amount=int(request.POST.get('bid_amount')),
                             bid_end_date=context['product_list'].bid_end_date,
                             wining=True)
                obj.max_amount = int(request.POST.get('bid_amount')) + 1
                obj.save()
                messages.info(request, "bid amount created")
                send_mail(
                    'Subject here',
                    'Here is the message.',
                    'from@example.com',
                    [request.user.email],
                    fail_silently=False,
                )
                pp = Product.objects.filter(id=request.POST['product_id'])
                print(type(pp))
                sellernotice = Notify.objects.create(message="You have new bidder", user=selleruser,
                                                     product=Product.objects.get(id=request.POST.get('product_id')))
                sellernotice.save()

            return HttpResponseRedirect(request.META.get('HTTP_REFERER', '/'))
    else:
        return HttpResponseRedirect(request.META.get('HTTP_REFERER', '/'))


def searchResult(request):
    check()
    query = request.GET.get('q')
    print(query)
    main_category = request.GET.get('q')

    category = Product.objects.values('category').distinct()
    if request.GET.get('q') == '':
        object_lists = Product.objects.filter(product_name=query)
        messages.success(request, "Please type something to search")
        context = {
            'object_list': object_lists,
            'categories': category,
            'cat': main_category,
        }
        print(context)
        return render(request, 'website/search.html', context)

    elif request.GET.get('data') == 'category':
        object_lists = Product.objects.filter(category=query)
        messages.success(request, request.GET.get('q'))

        print(object_lists)
        page = request.GET.get('page', 1)
        paginator = Paginator(object_lists, 4)
        try:
            objects = paginator.page(page)
        except PageNotAnInteger:
            objects = paginator.page(1)
        except EmptyPage:
            objects = paginator.page(paginator.num_pages)

        context = {
            'object_list': objects,
            'categories': category,
            'cat': main_category,
        }
        print(context)
        return render(request, 'website/search.html', context)
    elif request.GET.get('data') == 'product':
        print(query)

        object_list = Product.objects.filter(product_name__exact=query)
        category = Product.objects.values('category').distinct()
        print(category, 'a')
        print(object_list)
        context = {
            'object_list': object_list,
            'categories': category
        }
        return render(request, 'website/search.html', context)


def end(request, pk):
    product = Product.objects.get(id=pk)
    product.bid_end_date = datetime.now(tz=get_current_timezone())
    product.save()
    try:
        bidder = Bidder.objects.get(product_id_id=pk, wining=True)
        print(bidder.user_name_id)
        winner = User.objects.get(id=bidder.user_name_id)
        print(winner)
        product.winner = winner
        print(bidder)
        product.purchased = False
        product.minimum_price = bidder.bid_amount
        bidder.save()
        print(product)
        product.expired = True
        product.save()
        send_mail(
            'Subject here',
            'Auction has ended Winner is Declared.',
            'from@example.com',
            [request.user.email],
            fail_silently=False,
        )
        updatenotice = Notify.objects.create(message="You have a new bid amount for your products",
                                             user=User.objects.get(username=bidder.user_name ),
                                             product=Product.objects.get(id=pk))
        print(updatenotice)
        updatenotice.save()
        return HttpResponseRedirect(request.META.get('HTTP_REFERER', '/'))
    except Bidder.DoesNotExist:
        product.expired = True
        product.bid_end_date = datetime.now(tz=get_current_timezone())
        print(product.bid_end_date)
        product.save()
        send_mail(
            'Subject here',
            'Here is the message. NO winner is declared as no bids are present',
            'from@example.com',
            [request.user.email],
            fail_silently=False,
        )
        return HttpResponseRedirect(request.META.get('HTTP_REFERER', '/'))


def _cart_id(request):
    cart = request.session.session_key
    if not cart:
        cart = request.session.create()
    return cart


def add_cart(request, pk):
    if request.user.is_superuser or request.user.is_staff:
        messages.info(request, "You are and admin. You need to create a user account to bid")
        return HttpResponseRedirect(request.META.get('HTTP_REFERER', '/'))
    else:
        product = Product.objects.get(id=pk)
        if product.stock == 0:
            messages.warning(request, 'Stock is unavailable')
            return HttpResponseRedirect(request.META.get('HTTP_REFERER', '/'))
        else:
            if Cart.objects.filter(user=request.user):
                cart = Cart.objects.get(user=request.user)
            else:
                cart = Cart.objects.create(user=request.user, cart_id=int(pk))
                cart.save()

            try:
                cart_item = CartItem.objects.get(product=product, cart=cart)
                cart_item.save()
            except CartItem.DoesNotExist:
                cart_item = CartItem.objects.create(product=product, quantity=1, cart=cart)
                cart_item.save()
                product.stock = 0
                product.save()
            return redirect("cart")


def cart_detail(request, total=0, counter=0, cart_items=None):
    try:
        cart = Cart.objects.filter(user=request.user).first()
        cart_items = CartItem.objects.filter(cart=cart, active=True)
        for cart_item in cart_items:
            total += (cart_item.product.minimum_price * cart_item.quantity)
            counter += cart_item.quantity

    except ObjectDoesNotExist:
        pass

    stripe.api_key = settings.STRIPE_SECRET_KEY
    stripe_total = int(total)*100
    description = 'Auction-Store - New Order'
    data_key = settings.STRIPE_PUBLISHABLE_KEY
    if request.method == 'POST':
        try:
            token = request.POST['stripeToken']
            email = request.POST['stripeEmail']
            billingName = request.POST['stripeBillingName']
            billingAddress1 = request.POST['stripeBillingAddressLine1']
            billingCity = request.POST['stripeBillingAddressCity']
            billingPostcode = request.POST['stripeBillingAddressZip']
            billingCountry = request.POST['stripeBillingAddressCountryCode']
            shippingName = request.POST['stripeShippingName']
            shippingAddress1 = request.POST['stripeShippingAddressLine1']
            shippingCity = request.POST['stripeShippingAddressCity']
            shippingPostcode = request.POST['stripeShippingAddressZip']
            shippingCountry = request.POST['stripeShippingAddressCountryCode']
            customer = stripe.Customer.create(
                email=email,
                source=token
            )
            charge = stripe.Charge.create(
                amount=stripe_total * 100,
                currency='usd',
                description=description,
                customer=customer.id
            )
            # Creating the order
            try:
                order_details = Order.objects.create(
                    token=token,
                    total=total,
                    user_name=request.user,
                    emailAddress=email,
                    billingName=billingName,
                    billingAddress1=billingAddress1,
                    billingCity=billingCity,
                    billingPostcode=billingPostcode,
                    billingCountry=billingCountry,
                    shippingName=shippingName,
                    shippingAddress1=shippingAddress1,
                    shippingCity=shippingCity,
                    shippingPostcode=shippingPostcode,
                    shippingCountry=shippingCountry
                )
                order_details.save()
                for order_item in cart_items[:1]:
                    or_item = OrderItem.objects.create(
                        product=Product.objects.get(id=order_item.product.id),
                        quantity=order_item.quantity,
                        price=order_item.product.minimum_price,
                        order=order_details
                    )
                    or_item.save()

                    products = Product.objects.get(id=order_item.product.id)
                    products.stock = 0
                    products.purchased = True
                    print(products.stock)
                    products.winner = request.user
                    print(products.purchased)
                    products.save()
                    order_item.delete()

                    # print a message when the order is created
                    print('the order has been created')
                '''try:
                    sendEmail(order_details.id)
                    print('The order email has been sent')
                except IOError as e:
                    return e'''

                return redirect('thanks_page', order_details.id)
            except ObjectDoesNotExist:
                pass

        except stripe.error.CardError as e:
            return False, e

    return render(request, 'website/cart.html',
                  dict(cart_items=cart_items, total=total, counter=counter, data_key=data_key,
                       stripe_total=stripe_total, description=description,
                       profile=Profile.objects.get(user=request.user), ))


def cart_remove(request, pk):
    print("abc")
    cart = Cart.objects.get(user=request.user)
    print("cart")
    product = get_object_or_404(Product, id=pk)
    print(product)
    cart_item = CartItem.objects.get(product=product, cart=cart)
    cart_item.delete()
    product = Product.objects.get(id=pk)
    product.stock = 1
    product.save()
    return redirect('cart')


@login_required(redirect_field_name='next', login_url='signin')
def orderHistory(request):
    context = {
        'order_details': Order.objects.filter(user_name=request.user),
    }
    print(context)
    return render(request, 'website/orders_list.html', context)


@login_required(redirect_field_name='next', login_url='signin')
def viewOrder(request, pk):
    context = {
        'orders': Order.objects.filter(id=pk),
        'order_items': OrderItem.objects.filter(order_id=pk),
        'product': Product.objects.all(),
        'notify': Notify.objects.filter(user=request.user),
        'view': Notify.objects.filter(user=request.user, viewed=False).count()
    }

    return render(request, 'website/order_detail.html', context)


def thanks_page(request, pk):
    if pk:
        customer_order = get_object_or_404(Order, id=pk)
        if customer_order.user_name_id == request.user.id:

            return render(request, 'website/thankyou.html', {'customer_order': customer_order})
        else:
            messages.info(request, "You cannot view the order as the order placed is not yours")
            return HttpResponseRedirect(request.META.get('HTTP_REFERER', '/'))


def myproducts(request):
    ab = Seller.objects.filter(user_name=request.user)
    context= {
        'posts': ab ,
        'title':'AddedProducts',

    }
    return render(request, 'website/myproducts.html',context)


def message(request):
    if request.method == 'POST':
        users = request.user
        print(users.id)
        convo = request.POST['convo']
        product = request.POST['p_id']
        user_name_id = users.id
        con = Conversation(convo=convo, product_id_id=product, user_name_id=user_name_id)
        con.save()
        return HttpResponseRedirect(request.META.get('HTTP_REFERER', '/'))
    else:
        messages.info(request, "Please use the proper form to send the message")
        return HttpResponseRedirect(request.META.get('HTTP_REFERER', '/'))


def history(request):
    context = {
        'history': History.objects.filter(user_name=request.user),
        'title': 'History'
    }
    return render(request, 'website/history.html', context)


def favourite(request):
    context = {
        'favourite': Favourites.objects.filter(user_name=request.user),
        'title': 'Favourited Products'
    }
    return render(request, 'website/favourite.html', context)


def addFavourite(request):
    users = request.user
    pk = request.POST['pk']
    print(pk)
    user_name_id = users.id

    fav = Favourites.objects.filter(user_name=user_name_id, product_id_id=pk)
    if fav.count() == 1:
        fav.delete()
        messages.info(request, 'Favourite Removed')
    else:
        Favourites.objects.create(user_name=users, product_id_id=pk)
        messages.success(request, 'Added Fav ')
    return HttpResponseRedirect(request.META.get('HTTP_REFERER', '/'))


def addTime(request, pk):
    if request.method == 'POST':
        id = pk
        current = Product.objects.get(id=id)
        print(current.bid_end_date)
        timeadded = request.POST['time']
        if timeadded == 'one':
            current.bid_end_date += timedelta(hours=1)
            current.save()
        elif timeadded == 'two':

            current.bid_end_date += timedelta(hours=2)
            current.save()
        if timeadded == 'twelve':
            current.bid_end_date += timedelta(hours=12)
            current.save()
    return HttpResponseRedirect(request.META.get('HTTP_REFERER', '/'))


def createOrder2(request):
    if request.method == 'POST':

        token = request.POST['csrfmiddlewaretoken']
        email = request.POST['emailAddress']
        billingName = request.POST['billingName']
        billingAddress1 = request.POST['billingAddress1']
        billingCity = request.POST['billingCity']
        billingPostcode = request.POST['billingPostcode']
        billingCountry = request.POST['billingCountry']
        shippingName = request.POST['shippingName']
        shippingAddress1 = request.POST['shippingAddress1']
        shippingCity = request.POST['shippingCity']
        shippingPostcode = request.POST['shippingPostcode']
        shippingCountry = request.POST['shippingCountry']
        total = request.POST['total']
        # Creating the order
        winning = Product.objects.filter(status='auction', winner=request.user, purchased=False)[:1]
        print(winning)
        print("win")
        for order_item in winning:
            try:
                a = "b"
                order_details = Order.objects.create(
                    token=token,
                    total=total,
                    user_name=request.user,
                    emailAddress=email,
                    billingName=billingName,
                    billingAddress1=billingAddress1,
                    billingCity=billingCity,
                    billingPostcode=billingPostcode,
                    billingCountry=billingCountry,
                    shippingName=shippingName,
                    shippingAddress1=shippingAddress1,
                    shippingCity=shippingCity,
                    shippingPostcode=shippingPostcode,
                    shippingCountry=shippingCountry
                )
                order_details.save()

                or_item = OrderItem.objects.create(
                    product=Product.objects.get(id=order_item.id),
                    quantity=1,
                    price=order_item.minimum_price,
                    order=order_details
                )
                or_item.save()

                products = Product.objects.get(id=order_item.id)
                products.stock = 0
                products.purchased = True
                print(products.stock)

                print(products.purchased)
                products.save()
                

                # print a message when the order is created
                print('the order has been created')

                return redirect('thanks_page', order_details.id)
            except ObjectDoesNotExist:
                messages.error(request, "form error")
                return HttpResponseRedirect(request.META.get('HTTP_REFERER', '/'))



        else:
            messages.error(request,
                           "Sorry cannot order like that . Please view Order pages  wonaucitons or cart to place and order ")
            return HttpResponseRedirect(request.META.get('HTTP_REFERER', '/'))


def createCashShopOrder(request, total=0, counter=0, cart_items=None):
    try:
        cart = Cart.objects.filter(user=request.user).first()
        cart_items = CartItem.objects.filter(cart=cart, active=True)
        for cart_item in cart_items:
            total += (cart_item.product.minimum_price)
            counter += cart_item.quantity
    except ObjectDoesNotExist:
        messages.error(request, "form error")
        return HttpResponseRedirect(request.META.get('HTTP_REFERER', '/'))
    if request.method == 'POST':
        token = request.POST['csrfmiddlewaretoken']
        email = request.POST['emailAddress']
        billingName = request.POST['billingName']
        billingAddress1 = request.POST['billingAddress1']
        billingCity = request.POST['billingCity']
        billingPostcode = request.POST['billingPostcode']
        billingCountry = request.POST['billingCountry']
        shippingName = request.POST['shippingName']
        shippingAddress1 = request.POST['shippingAddress1']
        shippingCity = request.POST['shippingCity']
        shippingPostcode = request.POST['shippingPostcode']
        shippingCountry = request.POST['shippingCountry']
        total = request.POST['total']
        # Creating the order
        try:
            order_details = Order.objects.create(
                token=token,
                total=total,
                user_name=request.user,
                emailAddress=email,
                billingName=billingName,
                billingAddress1=billingAddress1,
                billingCity=billingCity,
                billingPostcode=billingPostcode,
                billingCountry=billingCountry,
                shippingName=shippingName,
                shippingAddress1=shippingAddress1,
                shippingCity=shippingCity,
                shippingPostcode=shippingPostcode,
                shippingCountry=shippingCountry
            )
            order_details.save()

            for order_item in cart_items[:1]:
                or_item = OrderItem.objects.create(
                    product=Product.objects.get(id=order_item.product.id),
                    quantity=1,
                    price=total,
                    order=order_details
                )
                or_item.save()

                products = Product.objects.get(id=order_item.product_id)
                products.stock = 0
                products.purchased = True
                print(products.stock)

                print(products.purchased)
                products.winner = request.user
                products.save()
                order_item.delete()

                # print a message when the order is created
                print('the order has been created')

            return redirect('thanks_page', order_details.id)
        except ObjectDoesNotExist:
            messages.error(request, "form error")
            return HttpResponseRedirect(request.META.get('HTTP_REFERER', '/'))
    else:
        messages.error(request,
                       "Sorry cannot order like that . Please view Order pages  wonaucitons or cart to place and order ")
        return HttpResponseRedirect(request.META.get('HTTP_REFERER', '/'))


def winner(request):
    notify = Notify.objects.filter(user=request.user)[:4]
    view = Notify.objects.filter(user=request.user, viewed=False).count()
    shop = Product.objects.filter(status='shop', winner=request.user).order_by('id')[:4]
    auction = Product.objects.filter(status='auction', winner=request.user).order_by('id')[:4]
    context = {'shopposts': shop, 'auctionposts': auction, 'notifications': notify, 'unviewed': view}
    return render(request, 'website/winner.html', context)


def winning(request):
    notify = Notify.objects.filter(user=request.user)[:4]
    view = Notify.objects.filter(user=request.user, viewed=False).count()
    winning_bid = Bidder.objects.filter(user_name=request.user)

    context = {'winning_bid': winning_bid, 'notifications': notify, 'unviewed': view}
    return render(request, 'website/winner.html', context)


def fileDispute(request):
    id = Product.objects.get(id=int(request.POST.get('id')))
    message = request.POST.get('message')
    print(id, message)
    Dispute.objects.create(product_id=id, user_name_id=request.user.id, dispute=message)
    messages.success(request, "dispute filed")
    return HttpResponseRedirect(request.META.get('HTTP_REFERER', '/'))
