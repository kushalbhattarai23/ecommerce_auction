# Generated by Django 2.2.5 on 2020-04-17 13:32

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('users', '0004_notify_product'),
    ]

    operations = [
        migrations.AlterField(
            model_name='notify',
            name='message',
            field=models.CharField(default='This notification is send to you by default.', max_length=500),
        ),
    ]