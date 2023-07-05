import uuid

from datetime import datetime
from django.conf import settings
from rest_framework import mixins, viewsets, status
from rest_framework.decorators import action
from rest_framework.response import Response
from rest_framework.permissions import AllowAny
from django.http import Http404
from src.db.models import Order, OrderItem, QUOTATION, REJECTED, ORDERED
from src.app.quotation.serializers import (
    QuotationReadSerializer, 
    QuotationPostSerializer, 
    QuotationUpdateSerializer,
    OrderReadSerializer)
from src.utils.response import BaseResponse
from src.utils.general import randomString

class QuotationView(mixins.CreateModelMixin, mixins.UpdateModelMixin, mixins.RetrieveModelMixin, viewsets.GenericViewSet):
    permission_classes = [AllowAny,]
    queryset = Order.objects.all()
    serializer_class = QuotationReadSerializer
    lookup_field = 'quotation_no'
    
    def get_serializer_class(self, ):
        if self.action == 'list' or self.action == 'retrieve':
            return QuotationReadSerializer
        elif self.action == 'update':
            return QuotationUpdateSerializer
        return QuotationPostSerializer
    
    def get_queryset(self):
        return self.queryset
     
    def create(self, request, *args, **kwargs):
        se = self.get_serializer(data=request.data)
        
        if se.is_valid():
            dt = se.validated_data
            
            order = Order.objects.create(
				quotation_no = uuid.uuid4(),
                status = QUOTATION,
                customer_id = dt["customer"]["id"],
                total_amount = dt["total_amount"],
                total_product_amount = dt["total_product_amount"],
                total_shipping_amount = dt["shipping_cost"]
            )
            
            if order:
                instances = [
					OrderItem(
						qty = i['product']['qty'],
						unit_selling_price = i['product']['price'],
						product_id = i['product']['id'],
                        supplier_id = i['supplier']['id'],
						order = order
					)
					for i in dt["items"]
				]
                
                orderItem = OrderItem.objects.bulk_create(instances)
                
                if orderItem:
                    payload = QuotationReadSerializer(order).data
                    ret = BaseResponse()
                    ret.setStatus(status.HTTP_201_CREATED)
                    ret.setMessage('quotation has been created')
                    return ret.info(payload)
            
            # ret = BaseResponse()
            # ret.setStatus(status.HTTP_201_CREATED)
            # ret.setMessage('quotation has been created')
            # return ret.info({'success':True})

        payload = se.errors
        ret = BaseResponse()
        ret.setStatus(status.HTTP_400_BAD_REQUEST)
        ret.setSuccess(False)
		
        return ret.info(payload)
    
    def update(self, request, pk=None, *args, **kwargs):
        
        instance = self.get_object()
        
        se = self.get_serializer(data=request.data)
        
        if se.is_valid():
            status_order = se.validated_data.get("status")
            
            instance.status = status_order
            instance.order_no = uuid.uuid4()
            instance.order_date = datetime.now()
            instance.updated_at = datetime.now()
            instance.save()
            
            payload = QuotationReadSerializer(instance).data
            
            ret = BaseResponse()
            ret.setStatus(status.HTTP_200_OK)
            if status_order == 'ordered':
                ret.setMessage('update quoation to ordered has been created')
            elif status_order == 'rejected':
                ret.setMessage('update quoation to rejected has been created')    
            return ret.info(payload)
        
        payload = se.errors
        ret = BaseResponse()
        ret.setStatus(status.HTTP_400_BAD_REQUEST)
        ret.setSuccess(False)
        
        return ret.info(payload)
    
    
    def retrieve(self, request, *args, **kwargs):
        instance = self.get_object()
        serializer = self.get_serializer(instance)
        payload = serializer.data
        
        return BaseResponse().info(payload)