# Generated by Django 4.2.2 on 2023-07-05 04:40

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('db', '0002_remove_rfqitem_product_remove_rfqitem_rfq_and_more'),
    ]

    operations = [
        migrations.AddField(
            model_name='orderitem',
            name='supplier',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='db.supplier'),
        ),
    ]