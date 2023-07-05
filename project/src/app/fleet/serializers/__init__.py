from src.db.models import Fleet
from src.app.shipping.serializers import ShippingReadSerializer
from rest_framework import serializers

class FleetReadSerializer(serializers.ModelSerializer):
    shipping_costs = ShippingReadSerializer(read_only=True,many=True)
    class Meta:
        model = Fleet
        fields = ('id','type','capacity','unit','shipping_costs')

class FleetPostSerializer(serializers.Serializer):
    type = serializers.CharField()
    capacity = serializers.IntegerField()
    unit = serializers.CharField()
    