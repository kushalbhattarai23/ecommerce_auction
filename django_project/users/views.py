from django.db.models import Count
from django.http import HttpResponseRedirect
from django.shortcuts import render, redirect
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.views.generic import UpdateView

from users.models import *
from website.models import *
from .forms import UserRegisterForm
from website.views import check, reverse
from django.contrib import auth

def register(request):
    if request.method == 'POST':
        form = UserRegisterForm(request.POST)
        if form.is_valid():
            user = form.save()
            username = form.cleaned_data.get('username')
            first_name = form.cleaned_data.get('first_name')
            last_name = form.cleaned_data.get('last_name')
            user.save()
            messages.success(request, 'Your account has been created! You are now able to log in')
            return redirect('login')
        else:
            messages.error(request, form.errors)
    else:

        form = UserRegisterForm()
    return render(request, 'users/register.html', {'form': form})


@login_required
def profile(request):
    notify = Notify.objects.filter(user=request.user)
    view = Notify.objects.filter(user=request.user, viewed=False).count()
    seller =Seller.objects.filter(user_name=request.user)
    fac=Favourites.objects.filter(user_name=request.user).order_by('id')[:4]
    history = History.objects.filter(user_name=request.user).order_by('id')[:4]
    print(seller)
    context = {
        'profile': Profile.objects.get(user=request.user),
        'notifications': notify, 'unviewed': view,
        'favourites' :fac,
        'historys':history,
        'seller':seller
    }


    return render(request, 'users/commonFile/profile.html', context)


class ProfileUpdateView(UpdateView):
    model = Profile
    fields = '__all__'
    context_object_name = 'profile'
    template_name = 'users/profile_update_form.html'

    def get_context_data(self, **kwargs):
        user = self.request.user
        context = super(ProfileUpdateView, self).get_context_data(**kwargs)

        return context

    def get_success_url(self, **kwargs):
        messages.success(self.request, "updated")

        return reverse('profile')


@login_required
def adminAnalytics(request):
    print(request.user)
    print(request.user.is_superuser)
    print(request.user.is_staff)
    if request.user.is_superuser or request.user.is_staff:
        firstdata = []
        labels = []
        data = []
        queryset = Product.objects.values('status').annotate(Count('status'))

        for each in queryset:
            for key, value in each.items():
                firstdata.append(value)

        i = 0
        while i < len(firstdata):
            labels.append(firstdata[i])
            data.append(firstdata[i + 1])
            i += 2
        firstdata2 = []
        labels2 = []
        data2 = []
        queryset2 = Product.objects.values('category').annotate(Count('category'))

        for eachs in queryset2:
            for key, value in eachs.items():
                firstdata2.append(value)

        j = 0
        while j < len(firstdata2):
            labels2.append(firstdata2[j])
            data2.append(firstdata2[j + 1])
            j += 2
        hist=History.objects.values('product_id').annotate(total=Count('product_id')).order_by('-total')[:5]
        favourite=Favourites.objects.values('product_id').annotate(total=Count('product_id')).order_by('-total')[:5]
        dispute = Dispute.objects.all().order_by('-created')[:5]

        context = {
            'stat':queryset,
            'cat':queryset2,
            'productsdesc': Product.objects.all(),
            'shopdesc': Product.objects.filter(status='shop'),
            'auctiondesc': Product.objects.filter(status='auction'),
            'userdesc': User.objects.all(),
            'orderdesc': Order.objects.all(),
            'sellerdesc': Seller.objects.all(),
            'bidderdesc': Bidder.objects.all(),
            'products': Product.objects.all().count(),
            'shop': Product.objects.filter(status='shop').count(),
            'auction': Product.objects.filter(status='auction').count(),
            'users': User.objects.all().count(),
            'order': Order.objects.all().count(),
            'seller': Seller.objects.values('user_name').distinct().count(),
            'bidder': Bidder.objects.all().count(),
            'labels': labels,
            'data': data,
            'labels2': labels2,
            'data2': data2,
            'viewed':hist,
            'fav':favourite,
            'notifications':Notify.objects.filter(user=request.user)[:5],
            'unviewed': Notify.objects.filter(user=request.user, viewed=False).count(),
            'disputedesc':Dispute.objects.all(),
            'dispute':Dispute.objects.filter(solved=False).count()
        }

        #return render(request, 'users/testadmin/index.html', context)
        return render(request, 'users/admin/analytics.html',context)
    else:
        messages.error(request,
                       "You need a Admin account to view admin dashboard.  Please log out and login through Admin account")
        return HttpResponseRedirect(request.META.get('HTTP_REFERER', '/'))

@login_required
def showNotifiy(request):

    n = Notify.objects.filter(user=request.user)
    notviewed=Notify.objects.filter(user=request.user,viewed=False).count()
    context = {
    'notifications': n,
    'unviewed': notviewed,
    'title':'Notifications'
    }
    return render(request,'users/notification.html', context)


@login_required
def deleteNotifiy(request, pk):
    n = Notify.objects.get(id=pk,user=request.user)
    print(n)
    n.viewed =True
    n.save()
    print("Abc")
    return HttpResponseRedirect(request.META.get('HTTP_REFERER', '/'))


def verifyLogin(request):
    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')
        user = auth.authenticate(username=username, password=password)
        if user is not None and user.is_superuser:
            # correct username and password login the user
            messages.info(request,"Welcome superuser")
            auth.login(request, user)
            return redirect('/admin/')
        elif user is not None and user.is_staff:
            auth.login(request, user)
            messages.info(request,"Welcome Admin")
            return redirect('/admin-dashboard/')
        elif user is not None:
            auth.login(request, user)
            messages.info(request, "Welcome user")
            return redirect('/home/')
        else:
            try:
                inactivate=User.objects.get(username=username)
                if not inactivate.is_active:
                    messages.warning(request,"Your account is deactivated. ")
                else:
                    messages.error(request, 'Error!! wrong password')
                return redirect('/login/')
            except User.DoesNotExist:
                messages.error(request, "No user with the username is present")
                return redirect('/login/')

    else:
        messages.error(request,'redirected to login')
        return redirect('/login/')

