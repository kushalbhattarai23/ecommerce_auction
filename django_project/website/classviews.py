from datetime import datetime

from django.contrib import messages
from django.db.models import Max
from django.db.models import Q
from django.http import HttpResponseRedirect
from django.urls import reverse
from django.utils import timezone
from django.views.generic import ListView
from django.views.generic.detail import DetailView
from django.views.generic.edit import CreateView
from django.views.generic.edit import DeleteView
from django.views.generic.edit import UpdateView

from users.models import Conversation, History, Favourites, Notify

from .models import Product, Seller, Bidder


class AddProductView(CreateView):
    model = Product
    fields = ["product_name", "category", "minimum_price", "bid_end_date", "status", "image", "image2", "image3",
              "description"]

    template_name = 'website/product_form.html'

    def get_context_data(self, **kwargs):
        context = super(AddProductView, self).get_context_data(**kwargs)
        context['categories'] = Product.objects.values('category').distinct()

        return context

    def form_invalid(self, form, **kwargs):
        context = self.get_context_data(**kwargs)
        context['form'] = form
        # here you can add things like:
        messages.error(self.request, "Error adding auction product")
        return self.render_to_response(context)

    def form_valid(self, form, **kwargs):
        data = self.request.POST
        
        obj = Seller(user_name=self.request.user, product_id=form.save())
        obj.save()
        return super(AddProductView, self).form_valid(form)

    def get_success_url(self):
        messages.success(self.request, "Succesfully added auction product")
        return reverse('auction')


class AddShopProductView(CreateView):
    model = Product
    fields = ["product_name", "category", "minimum_price", "status", "image", "image2", "image3", "description"]

    template_name = 'website/shopproduct_form.html'

    def form_valid(self, form):
        obj = Seller(user_name=self.request.user, product_id=form.save())
        obj.save()

        return super(AddShopProductView, self).form_valid(form)

    def get_success_url(self):
        messages.success(self.request, "Succesfully added Shop product")
        return reverse('shop')


class ProductDetailView(DetailView):
    model = Product
    context_object_name = 'product_list'
    template_name = 'website/product_detail.html'

    def get_context_data(self, **kwargs):

        context = super(ProductDetailView, self).get_context_data(**kwargs)
        x = Seller.objects.all()
        context["product_id"] = self.kwargs['pk']
        context["allproducts"] = Product.objects.filter(category=context["product_list"].category)[:4]
        print(context["allproducts"])
        context["seller"] = Seller.objects.get(product_id_id=self.kwargs['pk'])
        context["bidder"] = Bidder.objects.filter(Q(product_id_id=self.kwargs['pk'])).order_by('-bid_amount')
        context["convo"] = Conversation.objects.filter(Q(product_id_id=self.kwargs['pk']))

        try:
            context["favourite"] = Favourites.objects.get(product_id=self.kwargs['pk'],
                                                          user_name_id=self.request.user.id)
        except Favourites.DoesNotExist:
            context["favourite"] = None

        ABC = Bidder.objects.filter(Q(product_id_id=self.kwargs['pk'])).aggregate(Max('bid_amount'))
        context["minprice"] = ABC['bid_amount__max']
        users = self.request.user
        product = self.kwargs['pk']
        user_name_id = users.id
        if self.request.user.is_authenticated:
            try:
                History.objects.get(product_id_id=product, user_name_id=user_name_id)

                con = History.objects.get(product_id_id=product, user_name_id=user_name_id)
                con.created = timezone.now()
                con.save()

            except History.DoesNotExist:

                con = History(product_id_id=product, user_name_id=user_name_id)

                con.save()
            try:
                notice = Notify.objects.filter(user=self.request.user)
                context['notification'] = Notify.objects.filter(user=self.request.user)[:4]
                context['unviewed'] = Notify.objects.filter(user=self.request.user, viewed=False).count()
            except Notify.DoesNotExist:
                pass
        return context


class ProductUpdateView(UpdateView):
    model = Product
    fields = ["product_name", "minimum_price", "bid_end_date", "image", "image2", "image3", "description"]
    context_object_name = 'product_list'
    template_name = 'website/product_update_form.html'

    def get_context_data(self, **kwargs):
        user = self.request.user
        context = super(ProductUpdateView, self).get_context_data(**kwargs)
        x = Seller.objects.all()
        context["seller"] = Seller.objects.get(product_id_id=self.kwargs['pk'])
        context["bidder"] = Bidder.objects.filter(Q(product_id_id=self.kwargs['pk'])).order_by('-bid_amount')
        context["convo"] = Conversation.objects.filter(Q(product_id_id=self.kwargs['pk']))
        context["product_id"] = self.kwargs['pk']
        ABC = Bidder.objects.filter(Q(product_id_id=self.kwargs['pk'])).aggregate(Max('bid_amount'))
        context["minprice"] = ABC['bid_amount__max']
        users = self.request.user
        product = self.kwargs['pk']
        user_name_id = users.id
        print(context)

        return context

    def get_success_url(self, **kwargs):
        messages.success(self.request, "updated")
        id = self.kwargs['pk']
        print(type(id))
        return reverse('product_detail', args=[id])


class ShopProductUpdateView(UpdateView):
    model = Product
    fields = ["product_name", "minimum_price", "image", "image2", "image3", "description"]
    context_object_name = 'product_list'
    template_name = 'website/product_update_form.html'

    def get_context_data(self, **kwargs):
        user = self.request.user
        context = super(ShopProductUpdateView, self).get_context_data(**kwargs)
        x = Seller.objects.all()
        context["seller"] = Seller.objects.get(product_id_id=self.kwargs['pk'])
        context["bidder"] = Bidder.objects.filter(Q(product_id_id=self.kwargs['pk'])).order_by('-bid_amount')
        context["convo"] = Conversation.objects.filter(Q(product_id_id=self.kwargs['pk']))
        context["product_id"] = self.kwargs['pk']
        ABC = Bidder.objects.filter(Q(product_id_id=self.kwargs['pk'])).aggregate(Max('bid_amount'))
        context["minprice"] = ABC['bid_amount__max']
        users = self.request.user
        product = self.kwargs['pk']
        user_name_id = users.id
        print(context)

        return context

    def get_success_url(self, **kwargs):
        messages.success(self.request, "updated")
        id = self.kwargs['pk']
        print(type(id))
        return reverse('product_detail', args=[id])


