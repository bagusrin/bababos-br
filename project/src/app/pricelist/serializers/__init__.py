from src.db.models import Pricelist, Supplier, Product
from rest_framework import serializers

class PriceReadSerializer(serializers.ModelSerializer):
    class Meta:
        model = Pricelist
        fields = "__all__"
        depth = 1


class PricePostSerializer(serializers.Serializer):
    product_sku = serializers.CharField()
    supplier_code = serializers.CharField()
    price = serializers.FloatField()
    stock = serializers.IntegerField()
    
    def validate_product_sku(self,value):
        getProduct = Product.objects.filter(sku=value).first()
        
        if not getProduct:
            raise serializers.ValidationError('product sku not found')
        
        return getProduct.id
    
    def validate_supplier_code(self,value):
        getSupplier = Supplier.objects.filter(code=value).first()
        
        if not getSupplier:
            raise serializers.ValidationError('supplier code not found')
        
        return getSupplier.id
        
    
    def validate(self,data):
        # productSku = data.get('product_sku')
        # supplierCode = data.get('supplier_code')
        
        # getProduct = Product.objects.filter(sku=productSku).first()
        
        # if not getProduct:
        #     raise serializers.ValidationError('product sku not found')
        
        # getSupplier = Supplier.objects.filter(code=supplierCode).first()
        
        # if not getSupplier:
        #     raise serializers.ValidationError('supplier code not found')
        
        print(data)
        
        return data