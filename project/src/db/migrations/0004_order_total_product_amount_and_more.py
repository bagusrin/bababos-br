# Generated by Django 4.2.2 on 2023-07-05 15:59

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('db', '0003_orderitem_supplier'),
    ]

    operations = [
        migrations.AddField(
            model_name='order',
            name='total_product_amount',
            field=models.FloatField(blank=True, null=True),
        ),
        migrations.AddField(
            model_name='order',
            name='total_shipping_amount',
            field=models.FloatField(blank=True, null=True),
        ),
    ]
