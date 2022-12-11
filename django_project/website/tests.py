from django.test import TestCase

# Create your tests here.
from django.urls import reverse

from users.forms import UserRegisterForm
from .models import *

from users.models import Profile, Notify


class RegisterProfile2Test(TestCase):

    def create_user(self):
        return User.objects.create(username='kushal')

    def test_create_user(self):
        a = self.create_user()
        b = Profile.objects.last()
        self.assertTrue(isinstance(a, User))
        self.assertTrue(isinstance(b, Profile))
        self.assertEqual(a, b.user)


class RegisterProfileTest(TestCase):

    def create_user(self):
        return User.objects.create(username='kushal')

    def test_create_user(self):
        a = self.create_user()
        b = Profile.objects.last()
        self.assertTrue(isinstance(a, User))
        self.assertTrue(isinstance(b, Profile))
        self.assertEqual(a, b.user)

    def test_object_name(self):
        user = self.create_user()

        b = Profile.objects.last()
        expected_object_name = f'{user.username} Profile'
        self.assertEquals(expected_object_name, str(b))
        print(expected_object_name)


class RegisterUserTest(TestCase):
    def create_user(self):
        return User.objects.create(
        )

    def test_create_user(self):
        a = self.create_user()
        self.assertTrue(isinstance(a, User))


class AddProductUserTest(TestCase):

    def create_shop(self):
        return Product.objects.create(id=33,
                                      product_name="abc2", category="Electronics", minimum_price="12", status="shop",
                                      image="abc.png",
                                      description="abc2"
                                      )

    def create_auction(self):
        return Product.objects.create(id=23,
                                      product_name="abc", category="Electronics", minimum_price="12", status="auction",
                                      image="abc.png",
                                      description="abc"
                                      )

    def test_get_image(self):
        filename = "abc.png"
        path = "auction_system/image_{0}_{1}".format(str(time()), filename)
        created_path = getImage(self, filename)
        self.assertEqual(path, created_path)

    def test_create_shop(self):
        a = self.create_shop()

        self.assertTrue(isinstance(a, Product))

    def test_create_auction(self):
        a = self.create_auction()
        self.assertTrue(isinstance(a, Product))


class HomeViewTest(TestCase):

    def test_home(self):
        url = reverse("home")
        resp = self.client.get(url)
        print(resp, 'a')
        self.assertEqual(resp.status_code, 200)

    def test_website_home(self):
        url = reverse("website-home")
        resp = self.client.get(url)
        print(resp, 'b')
        self.assertEqual(resp.status_code, 200)


class ShopViewTest(TestCase):
    def test_shop(self):
        url = reverse("shop")
        resp = self.client.get(url)
        print(resp, 'c')
        self.assertEqual(resp.status_code, 200)


class AuctionViewTest(TestCase):

    def test_auction(self):
        url = reverse("auction")
        resp = self.client.get(url)
        print(resp, 'd')
        self.assertEqual(resp.status_code, 200)


class ExpiredHomeViewTest(TestCase):

    def test_expiredHome(self):
        url = reverse("expired")
        resp = self.client.get(url)
        print(resp, 'e')
        self.assertEqual(resp.status_code, 200)


class LoginViewTest(TestCase):

    def test_login(self):
        url = reverse("login")
        resp = self.client.get(url)
        print(resp, 'f')
        self.assertEqual(resp.status_code, 200)


class NotificationViewTest(TestCase):

    def test_notification(self):
        url = reverse("viewnotify")
        resp = self.client.get(url)
        print(resp, 'h')
        self.assertEqual(resp.status_code, 302)


class MyBidsViewTest(TestCase):

    def test_mybids(self):
        url = reverse("mybids")
        resp = self.client.get(url)
        print(resp, 'i')
        self.assertEqual(resp.status_code, 302)


class LogInTest(TestCase):

    def setUp(self):
        self.credentials = {
            'username': 'testuser',
            'password': 'secret'}
        User.objects.create_user(**self.credentials)

    def test_login(self):
        # send login data
        response = self.client.post('/login/', self.credentials, follow=True)
        # should be logged in now
        print(response, 'j')
        self.assertTrue(response.context['user'].is_authenticated)


class AllTestViewTest(TestCase):

    def setUp(self):
        self.credentials = {
            'username': 'testuser',
            'password': 'secret'}
        User.objects.create_user(**self.credentials)

    def test_login(self):
        # send login data
        response = self.client.post('/login/', self.credentials, follow=True)
        # should be logged in now

        self.assertTrue(response.context['user'].is_authenticated)
        url = reverse('home')
        resp = self.client.get(url)
        self.assertEqual(resp.status_code, 200)
        url = reverse("website-home")
        resp = self.client.get(url)
        self.assertEqual(resp.status_code, 200)
        url = reverse("expired")
        resp = self.client.get(url)

        self.assertEqual(resp.status_code, 200)
        url = reverse("shop")
        resp = self.client.get(url)

        self.assertEqual(resp.status_code, 200)
        url = reverse("auction")
        resp = self.client.get(url)

        self.assertEqual(resp.status_code, 200)
        url = reverse("home")
        resp = self.client.get(url)

        self.assertEqual(resp.status_code, 200)
        url = reverse("viewnotify")
        resp = self.client.get(url)

        self.assertEqual(resp.status_code, 200)
        url = reverse("mybids")
        resp = self.client.get(url)

        self.assertEqual(resp.status_code, 200)
        url = reverse("all-product")
        resp = self.client.get(url)

        self.assertEqual(resp.status_code, 200)
        url = reverse("won")
        resp = self.client.get(url)

        self.assertEqual(resp.status_code, 200)

        url = reverse("profile")
        resp = self.client.get(url)

        self.assertEqual(resp.status_code, 200)
        url = reverse("post-create")
        resp = self.client.get(url)

        self.assertEqual(resp.status_code, 200)
        url = reverse("shopcreate")
        resp = self.client.get(url)

        self.assertEqual(resp.status_code, 200)
        Product.objects.create(id=1,
                               product_name="abc2", category="Games", minimum_price="12", status="shop",
                               image="abc.png",
                               description="abc2"
                               )
        Product.objects.create(id=2,
                               product_name="abc23", category="Games", minimum_price="123", bid_end_date="2021-01-12",
                               status="auction",
                               image="abc3.png",
                               description="abc23"
                               )
        Product.objects.create(id=3,
                               product_name="abc23", category="Games", minimum_price="123", bid_end_date="2021-01-12",
                               status="auction",
                               image="abc3.png",
                               description="abc23"
                               )
        Seller.objects.create(product_id_id=1, user_name_id=1)
        Seller.objects.create(product_id_id=2, user_name_id=1)
        Seller.objects.create(product_id_id=3, user_name_id=1)

        url = reverse("product_detail", args=[1])
        resp = self.client.get(url)

        self.assertEqual(resp.status_code, 200)
        url = reverse("updateAcc", args=[1])
        resp = self.client.get(url)

        self.assertEqual(resp.status_code, 200)
        url = reverse("search")
        resp = self.client.get(url, data={'data': 'category', 'q': 'Games'})

        self.assertEqual(resp.status_code, 200)
        url = reverse("search")
        resp = self.client.get(url, data={'data': 'product', 'q': 'abc2'})

        self.assertEqual(resp.status_code, 200)
        url = reverse("search")
        resp = self.client.get(url, data={'q': ''})

        self.assertEqual(resp.status_code, 200)
        url = reverse("addtime", args=[2])

        resp = self.client.post(url, data={'time': 'twelve', 'pk': 2})

        self.assertEqual(resp.status_code, 302)
        url = reverse("addtime", args=[2])
        resp = self.client.post(url, data={'time': 'one', 'pk': 2})

        self.assertEqual(resp.status_code, 302)
        url = reverse("addtime", args=[2])
        resp = self.client.post(url, data={'time': 'two', 'pk': 2})

        self.assertEqual(resp.status_code, 302)
        url = reverse("message")
        resp = self.client.post(url, data={'p_id': 2, 'convo': "hi i want to buy"})

        self.assertEqual(resp.status_code, 302)
        url = reverse("update", args=[2])
        resp = self.client.get(url)

        self.assertEqual(resp.status_code, 200)
        url = reverse("updateshop", args=[1])
        resp = self.client.get(url)

        self.assertEqual(resp.status_code, 200)

        url = reverse("addfavourite")
        resp = self.client.post(url, data={'pk': 2})
        self.assertEqual(resp.status_code, 302)
        url = reverse("addfavourite")
        resp = self.client.post(url, data={'pk': 2})
        self.assertEqual(resp.status_code, 302)
        url = reverse("order_history")
        resp = self.client.post(url)
        self.assertEqual(resp.status_code, 200)
        url = reverse("cart")
        resp = self.client.get(url)
        self.assertEqual(resp.status_code, 200)
        url = reverse("add_cart", args=[1])
        resp = self.client.post(url)
        self.assertEqual(resp.status_code, 302)
        url = reverse("cart")
        resp = self.client.get(url)
        self.assertEqual(resp.status_code, 200)
        url = reverse("cart_remove", args=[1])
        resp = self.client.get(url)
        self.assertEqual(resp.status_code, 302)

        url = reverse("logout")
        resp = self.client.get(url)

        self.assertEqual(resp.status_code, 302)
        url = reverse("mybids")
        resp = self.client.get(url)

        self.assertEqual(resp.status_code, 302)

        self.credentials2 = {
            'username': 'testusess',
            'password': 'secretss',
            'is_staff': True,
            'is_superuser': True,

        }
        User.objects.create_user(**self.credentials2)
        resp = self.client.post('/verifylogin/', self.credentials2, follow=True)
        self.assertEqual(resp.status_code, 200)
        url = reverse("add_cart", args=[1])
        resp = self.client.post(url)
        self.assertEqual(resp.status_code, 302)
        url = reverse("sellDashboard")
        resp = self.client.post(url)
        self.assertEqual(resp.status_code, 200)
        url = reverse("logout")
        resp = self.client.get(url)

        self.assertEqual(resp.status_code, 302)
        self.credentialsne = {
            'username': 'testy',
            'password': 'secretss',
        }
        User.objects.create_user(**self.credentialsne)
        resp = self.client.post('/verifylogin/', self.credentialsne, follow=True)
        self.assertEqual(resp.status_code, 200)
        url = reverse("save_bid")
        resp = self.client.post(url, data={'product_id': 2, 'bid_amount': 4000})
        self.assertEqual(resp.status_code, 302)
        url = reverse("save_bid")
        resp = self.client.post(url, data={'product_id': 2, 'bid_amount': 3000})
        self.assertEqual(resp.status_code, 302)
        url = reverse("logout")
        resp = self.client.get(url)

        self.assertEqual(resp.status_code, 302)

        self.credentials4 = {
            'username': 't',
            'password': 'secretss',

        }
        User.objects.create_user(**self.credentials4)
        resp = self.client.post('/verifylogin/', self.credentials4, follow=True)
        self.assertEqual(resp.status_code, 200)
        url = reverse("save_bid")
        resp = self.client.post(url, data={'product_id': 2, 'bid_amount': 4000})
        self.assertEqual(resp.status_code, 302)
        url = reverse("save_bid")
        resp = self.client.post(url, data={'product_id': 2, 'bid_amount': 4009})
        self.assertEqual(resp.status_code, 302)
        url = reverse("save_bid")
        resp = self.client.post(url, data={'product_id': 2, 'bid_amount': 6000})
        self.assertEqual(resp.status_code, 302)
        url = reverse("save_bid")
        resp = self.client.get(url, data={'product_id': 2, 'bid_amount': 6000})
        self.assertEqual(resp.status_code, 302)
        url = reverse("logout")
        resp = self.client.get(url)
        print(resp, 'li')
        self.assertEqual(resp.status_code, 302)
        url = reverse("register")

        resp = self.client.post(url,
                                data={'email': "samanghar@gmail.com", 'username': "saman", 'first_name': "kushal",
                                      'last_name': "bhattarai", 'role': "Admin", 'password1': "asid1234",
                                      'password2': "asid1234", 'is_staff': True}, follow=True)
        self.assertEqual(resp.status_code, 200)
        url = reverse("register")

        resp = self.client.post(url,
                                data={'email': "samanghar3@gmail.com", 'username': "saman3", 'first_name': "kushal",
                                      'last_name': "bhattarai", 'role': "SuperAdmin", 'password1': "asid1234",
                                      'password2': "asid1234", 'is_staff': True}, follow=True)
        self.assertEqual(resp.status_code, 200)
        url = reverse("register")
        resp = self.client.get(url)
        self.assertEqual(resp.status_code, 200)
        url = reverse("register")

        resp = self.client.post(url,
                                data={'email': "samanghar2@gmail.com", 'username': "saman2", 'first_name': "kushal",
                                      'last_name': "bhattarai", 'role': "User", 'password1': "asid1234",
                                      'password2': "asid1234", 'is_staff': False}, follow=True)
        self.assertEqual(resp.status_code, 200)

        resp = self.client.post(url,
                                data={'email': "samanghar@gmail.com", 'username': "saman", 'first_name': "kushal",
                                      'last_name': "bhattarai", 'role': "User", 'password1': "asid1234",
                                      'password2': "asid123", 'is_staff': False}, follow=True)
        self.assertEqual(resp.status_code, 200)
        self.credentials55 = {
            'username': 'samam3',
            'password': 'asid1234',

        }
        resp = self.client.post('/verifylogin/', self.credentials55, follow=True)
        self.assertEqual(resp.status_code, 200)
        resp = self.client.get('/verifylogin/')
        self.assertEqual(resp.status_code, 302)
        self.credentials4 = {
            'username': 'kushalnew',
            'password': 'kushal1234',

        }
        resp = self.client.post('/verifylogin/', self.credentials4, follow=True)
        self.assertEqual(resp.status_code, 200)

        self.credentials5 = {
            'username': 'testusersss',
            'password': 'secretss',

        }
        User.objects.create_user(**self.credentials5)
        resp = self.client.post('/verifylogin/', self.credentials5, follow=True)
        self.assertEqual(resp.status_code, 200)
        url = reverse("save_bid")
        resp = self.client.post(url, data={'product_id': 2, 'bid_amount': 5000})
        self.assertEqual(resp.status_code, 302)
        url = reverse("winning")
        resp = self.client.get(url)
        self.assertEqual(resp.status_code, 200)
        url = reverse("cart")
        resp = self.client.get(url)
        self.assertEqual(resp.status_code, 200)
        url = reverse("add_cart", args=[1])
        resp = self.client.post(url)
        self.assertEqual(resp.status_code, 302)
        url = reverse("admin-home")
        resp = self.client.get(url)
        self.assertEqual(resp.status_code, 302)
        url = reverse("logout")
        resp = self.client.get(url)


        self.assertEqual(resp.status_code, 302)
        resp = self.client.post('/verifylogin/', self.credentials2, follow=True)
        self.assertEqual(resp.status_code, 200)
        url = reverse("end", args=[3])
        resp = self.client.post(url)
        self.assertEqual(resp.status_code, 302)
        url = reverse("end", args=[2])
        resp = self.client.post(url)
        self.assertEqual(resp.status_code, 302)
        url = reverse("message")
        resp = self.client.get(url)
        self.assertEqual(resp.status_code, 302)
        url = reverse("favourites")
        resp = self.client.get(url)
        self.assertEqual(resp.status_code, 200)
        url = reverse("history")
        resp = self.client.get(url)
        self.assertEqual(resp.status_code, 200)
        url = reverse("admin-home")
        resp = self.client.get(url)
        self.assertEqual(resp.status_code, 200)
        url = reverse("winner")
        resp = self.client.get(url)
        self.assertEqual(resp.status_code, 200)
        url = reverse("home")
        resp = self.client.get(url)
        self.assertEqual(resp.status_code, 200)

        url = reverse("logout")
        resp = self.client.get(url)

        self.assertEqual(resp.status_code, 302)
        self.credentialsnew = {
            'username': 'testuses',
            'password': 'secretss',
        }
        response = self.client.post('/verifylogin/', self.credentialsnew, follow=True)

        resp = self.client.get(url)
        self.assertEqual(resp.status_code, 302)
        self.credentials3 = {
            'username': 'test',
            'password': 'secretss',
            'is_staff': True,
        }
        User.objects.create_user(**self.credentials3)
        resp = self.client.post('/verifylogin/', self.credentials3, follow=True)
        self.assertEqual(resp.status_code, 200)
        url = reverse("save_bid")
        resp = self.client.post(url, data={'product_id': 2, 'bid_amount': 5000}, follow=True)
        self.assertEqual(resp.status_code, 200)

        url = reverse("logout")
        resp = self.client.get(url)


