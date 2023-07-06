from src.db.models import Order, OrderItem, Product, Supplier, Customer
from rest_framework import serializers

class OrderReadSerializer(serializers.ModelSerializer):
    customer = serializers.SerializerMethodField()
    sku = serializers.SerializerMethodField()
    order_date = serializers.SerializerMethodField()
    unit = serializers.SerializerMethodField()
    
    class Meta:
        model = OrderItem
        fields = ('customer','sku','order_date','unit_selling_price','qty','unit')
        
    def get_customer(self,obj):
        return self.get_order(obj)['customer_code']
    
    def get_order_date(self,obj):
        return self.get_order(obj)['order_date']
    
    def get_unit(self,obj):
        return self.get_product(obj)['unit']
    
    def get_sku(self,obj):
        return self.get_product(obj)['sku']
        
    def get_order(self,obj):
        dt = Order.objects.select_related('customer').filter(id=obj.order_id).first()
        return {
            "order_no": dt.order_no,
            "order_date": dt.order_date,
            "customer_code": dt.customer.code 
        }
        
    def get_product(self, obj):
        dt = Product.objects.filter(id=obj.product_id).first()
        
        return {
            "sku": dt.sku,
            "unit": dt.unit
        }