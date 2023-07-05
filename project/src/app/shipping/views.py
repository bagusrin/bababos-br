from datetime import datetime
from django.conf import settings
from rest_framework import mixins, viewsets, status
from rest_framework.decorators import action
from rest_framework.response import Response
from rest_framework.permissions import AllowAny
from django.http import Http404
from src.db.models import ShippingCost
from src.app.shipping.serializers import ShippingReadSerializer, ShippingPostSerializer
from src.utils.response import BaseResponse

class ShippingView(mixins.CreateModelMixin, mixins.UpdateModelMixin, mixins.RetrieveModelMixin, viewsets.GenericViewSet):
    permission_classes = [AllowAny,]
    serializer_class = ShippingPostSerializer
    queryset = ShippingCost.objects.filter(deleted_at__isnull=True)
    
    def get_serializer_class(self, ):
        if self.action == 'list' or self.action == 'retrieve':
            return ShippingReadSerializer
        return ShippingPostSerializer
    
    def get_queryset(self):
        name = self.request.GET.get('name')
        #print(name)
        return self.queryset.filter(deleted_at__isnull=True,name=name) if name else self.queryset
     
    def create(self, request, *args, **kwargs):
        data = request.data
        data['fleet'] = data['fleet_id']
        se = self.get_serializer(data=data)
        
        if se.is_valid():
            origin = se.validated_data.get("origin")
            destination = se.validated_data.get("destination")
            price = se.validated_data.get("price")
            fleet = se.validated_data.get("fleet")

            shipping, icreated = ShippingCost.objects.get_or_create(
					origin=origin,
					destination=destination,
                    price=price,
                    fleet=fleet)

            shipping.save()

            payload = ShippingReadSerializer(shipping).data

            ret = BaseResponse()
            ret.setStatus(status.HTTP_201_CREATED)
            ret.setMessage('shipping cost has been created')
            return ret.info(payload)

        payload = se.errors
        ret = BaseResponse()
        ret.setStatus(status.HTTP_400_BAD_REQUEST)
        ret.setSuccess(False)
		
        return ret.info(payload)

    def list(self, request, *args, **kwargs):
        pName = request.query_params.get('name')

        queryset = self.queryset.filter(deleted_at__isnull=True)

        if pName:
            queryset = self.get_queryset()

        serializer = self.get_serializer(queryset,many=True)
        payload = serializer.data

        return BaseResponse().info(payload)

    def retrieve(self, request, *args, **kwargs):
        instance = self.get_object()
        serializer = self.get_serializer(instance)
        payload = serializer.data

        return BaseResponse().info(payload)