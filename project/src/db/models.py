from django.db import models

QUOTATION = "quotation"
REJECTED = "rejected"
ORDERED = "ordered"

class BaseModel(models.Model):
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now_add=True)
    deleted_at = models.DateTimeField(blank=True, null=True)
    
    class Meta:
        abstract = True

class Customer(BaseModel):
    code = models.CharField(unique=True, editable=False, max_length=10)
    address = models.CharField(max_length=100)
    city = models.CharField(max_length=20)
    state = models.CharField(max_length=20)
    
    class Meta:
        db_table = 'customers'
        
class Supplier(BaseModel):
    code = models.CharField(unique=True, editable=False, max_length=10)
    address = models.CharField(max_length=100)
    city = models.CharField(max_length=20)
    state = models.CharField(max_length=20)
    
    class Meta:
        db_table = 'suppliers'
        
class Product(BaseModel):
    sku = models.CharField(unique=True, editable=False, max_length=30)
    name = models.CharField(max_length=100)
    unit = models.CharField(max_length=10)
    
    class Meta:
        db_table = 'products'
        
class Pricelist(BaseModel):
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    supplier = models.ForeignKey(Supplier, on_delete=models.CASCADE)
    price = models.FloatField()
    unit = models.CharField(max_length=10)
    stock = models.IntegerField()
    
    class Meta:
        db_table = 'pricelists'
        
class Fleet(BaseModel):
    type = models.CharField(max_length=10)
    capacity = models.IntegerField()
    unit = models.CharField(max_length=10)

    class Meta:
        db_table = 'fleets'


class ShippingCost(BaseModel):
    fleet = models.ForeignKey(Fleet, on_delete=models.CASCADE, related_name='shipping_costs')
    origin = models.CharField(max_length=20)
    destination = models.CharField(max_length=20)
    price = models.FloatField()

    class Meta:
        db_table = 'shipping_costs'
        
class Order(BaseModel):
    
    STATUS = [
        (QUOTATION, "quotation"),
        (REJECTED, "rejected"),
        (ORDERED, "ordered"),
    ]
    
    customer = models.ForeignKey(Customer, on_delete=models.CASCADE)
    quotation_no = models.CharField(max_length=10, blank=True, null=True)
    order_no = models.CharField(max_length=10, blank=True, null=True)
    quotation_date = models.DateTimeField(auto_now_add=True, blank=True, null=True)
    order_date = models.DateTimeField(blank=True, null=True)
    total_amount = models.FloatField()
    total_product_amount = models.FloatField(blank=True, null=True)
    total_shipping_amount = models.FloatField(blank=True, null=True)
    status = models.CharField(max_length=10, default=QUOTATION, choices=STATUS)
    
    class Meta:
        db_table = 'orders'
        
class OrderItem(BaseModel):
    order = models.ForeignKey(Order, on_delete=models.CASCADE, related_name='items')
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    supplier = models.ForeignKey(Supplier, on_delete=models.CASCADE, blank=True, null=True)
    qty = models.IntegerField()
    unit = models.CharField(max_length=10)
    unit_selling_price = models.FloatField()
    
    class Meta:
        db_table = 'order_items'
    