# Generated by Django 2.2.5 on 2020-04-18 03:52

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion
import django.utils.timezone


class Migration(migrations.Migration):

    dependencies = [
        ('website', '0002_auto_20200417_1923'),
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('users', '0005_auto_20200417_1917'),
    ]

    operations = [
        migrations.CreateModel(
            name='Dispute',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created', models.DateTimeField(default=django.utils.timezone.now)),
                ('dispute', models.CharField(max_length=1000)),
                ('product_id', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='website.Product')),
                ('user_name', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
    ]
