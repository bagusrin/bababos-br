from src.db.models import Customer
from rest_framework import serializers

class CustomerReadSerializer(serializers.ModelSerializer):
    class Meta:
        model = Customer
        fields = '__all__'


class CustomerPostSerializer(serializers.Serializer):
    code = serializers.CharField()
    address = serializers.CharField()
    city = serializers.CharField()
    state = serializers.CharField()