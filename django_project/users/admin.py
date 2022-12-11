from django.contrib import admin
from .models import *

admin.site.register(Profile)

admin.site.register(Conversation)
admin.site.register(History)
admin.site.register(Favourites)
admin.site.register(Notify)
admin.site.register(Dispute)
