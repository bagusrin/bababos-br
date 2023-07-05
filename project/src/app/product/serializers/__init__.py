from src.db.models import Product
from rest_framework import serializers

class ProductReadSerializer(serializers.ModelSerializer):
    class Meta:
        model = Product
        fields = '__all__'


class ProductPostSerializer(serializers.Serializer):
    sku = serializers.CharField()
    name = serializers.CharField()
    unit = serializers.CharField()