import uuid

from datetime import datetime
from django.conf import settings
from rest_framework import mixins, viewsets, status
from rest_framework.decorators import action
from rest_framework.response import Response
from rest_framework.permissions import AllowAny
from django.http import Http404
from src.db.models import OrderItem
from src.app.order.serializers import OrderReadSerializer
from src.utils.response import BaseResponse

class OrderView(mixins.CreateModelMixin, mixins.UpdateModelMixin, mixins.RetrieveModelMixin, viewsets.GenericViewSet):
    permission_classes = [AllowAny,]
    queryset = OrderItem.objects.all()
    serializer_class = OrderReadSerializer
    lookup_field = 'order_no'
    
    def get_serializer_class(self, ):
        return OrderReadSerializer
    
    def get_queryset(self):
        return self.queryset.filter(order__status='ordered')
     
    def list(self, request, *args, **kwargs):
        serializer = self.get_serializer(self.get_queryset(),many=True)
        payload = serializer.data

        return BaseResponse().info(payload)
    
    
    def retrieve(self, request, *args, **kwargs):
        instance = self.get_object()
        serializer = self.get_serializer(instance)
        payload = serializer.data
        
        return BaseResponse().info(payload)