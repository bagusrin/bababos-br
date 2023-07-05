from src.db.models import ShippingCost, Fleet
from rest_framework import serializers

class ShippingReadSerializer(serializers.ModelSerializer):
    class Meta:
        model = ShippingCost
        fields = ('id','origin','destination','price','fleet','created_at','updated_at','deleted_at')
        depth = 1


class ShippingPostSerializer(serializers.ModelSerializer):
    class Meta:
        model = ShippingCost
        fields = ('origin', 'destination', 'price', 'fleet')