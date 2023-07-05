from src.db.models import Supplier
from rest_framework import serializers

class SupplierReadSerializer(serializers.ModelSerializer):
    class Meta:
        model = Supplier
        fields = '__all__'


class SupplierPostSerializer(serializers.Serializer):
    code = serializers.CharField()
    address = serializers.CharField()
    city = serializers.CharField()
    state = serializers.CharField()