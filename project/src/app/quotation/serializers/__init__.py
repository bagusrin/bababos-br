from src.db.models import Order, OrderItem, Product, Supplier, Pricelist, Customer, ShippingCost, Customer
from rest_framework import serializers

class BaseItemSerializer(serializers.ModelSerializer):
    items = serializers.SerializerMethodField()
    customer = serializers.SerializerMethodField()
    
    def get_items(self, obj):
        items = OrderItem.objects.select_related('product','supplier').filter(order_id=obj.id)
        
        list = []
        for item in items:
            dt = {
                "product":{
                    "id": item.product.id,
                    "sku": item.product.sku,
                    "qty": item.qty,
                    "price": item.unit_selling_price
                },
                "supplier":{
                    "id": item.supplier.id,
                    "code": item.supplier.code,
                    "address": item.supplier.address,
                    "city": item.supplier.city
                }
            }
            
            list.append(dt)
        
        return list
    
    def get_customer(self, obj):
        dt = Customer.objects.filter(id=obj.customer_id).values('id','code','address','city')
        return dt[0]

class QuotationReadSerializer(BaseItemSerializer):
    items = serializers.SerializerMethodField()
    customer = serializers.SerializerMethodField()
    class Meta:
        model = Order
        fields = ('quotation_no','quotation_date','total_amount','total_product_amount',
            'total_shipping_amount','status','customer','items')
        
class OrderReadSerializer(BaseItemSerializer):
    items = serializers.SerializerMethodField()
    customer = serializers.SerializerMethodField()
    class Meta:
        model = Order
        fields = ('order_no','order_date','total_amount','total_product_amount',
            'total_shipping_amount','status','customer','items')
    
    
class QuotationPostSerializer(serializers.Serializer):
    customer_code = serializers.CharField()
    items = serializers.ListField(required=True)
    
    def validate(self,data):
        customer_code = data.get("customer_code")
        items = data.get("items")
        
        getCustomer = Customer.objects.filter(code=customer_code).first()
        
        if not getCustomer:
                raise serializers.ValidationError('customer '+customer_code+' not found')
        
        list = []
        routes = [getCustomer.city]
        total_product_amount = 0
        for obj in items:
            
            getPrice = Pricelist.objects.select_related(
                'product','supplier'
            ).filter(product__sku=obj["sku"]
            ).filter(stock__gte = obj["qty"]).order_by('price').first()
            
            if not getPrice:
                raise serializers.ValidationError('product sku '+obj["sku"]+' not found or stock is empty')
            
            price = getPrice.price
            
            if obj["qty"] >= 100:
                price = price + (price*0.1)
            elif obj["qty"] >= 50:
                price = price + (price*0.15)
            elif obj["qty"] >= 10:
                price = price + (price*0.2)
            elif obj["qty"] < 10:
                price = price + (price*0.25)
            
            dt = {
                "product":{
                    "id": getPrice.product.id,
                    "sku": getPrice.product.sku,
                    "qty": obj["qty"],
                    "price": price
                },
                "supplier":{
                    "id": getPrice.supplier.id,
                    "code": getPrice.supplier.code,
                    "city": getPrice.supplier.city
                }
            }
            
            list.append(dt)
            routes.append(getPrice.supplier.city)
            total_product_amount += price
            
        shipping_cost = ShippingCost.objects.filter(destination__in=routes,fleet_id=1).order_by('-price').first()
            
        dtBuiler = {
            "customer": {
                "id": getCustomer.id,
                "code": getCustomer.code,
                "city": getCustomer.city
            },
            "shipping_cost": shipping_cost.price,
            "items": list,
            "total_product_amount": total_product_amount,
            "total_amount": shipping_cost.price + total_product_amount
        }
            
        #print(routes)
        #print(dtBuiler)
        return dtBuiler
    
class QuotationUpdateSerializer(serializers.Serializer):
    status = serializers.CharField()