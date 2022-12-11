from django.apps import AppConfig


class BlogConfig(AppConfig):
    name = 'website'

    def ready(self):
        pass
