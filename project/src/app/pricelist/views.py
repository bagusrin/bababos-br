from datetime import datetime
from django.conf import settings
from rest_framework import mixins, viewsets, status
from rest_framework.decorators import action
from rest_framework.response import Response
from rest_framework.permissions import AllowAny
from django.http import Http404
from src.db.models import Pricelist
from src.app.pricelist.serializers import PricePostSerializer, PriceReadSerializer
from src.utils.response import BaseResponse

class PriceView(mixins.CreateModelMixin, mixins.UpdateModelMixin, mixins.RetrieveModelMixin, viewsets.GenericViewSet):
    permission_classes = [AllowAny,]
    serializer_class = PricePostSerializer
     
    def create(self, request, *args, **kwargs):
        se = PricePostSerializer(data=request.data)
        print(se)
        
        if se.is_valid():
            price = se.validated_data.get("price")
            stock = se.validated_data.get("stock")
            product_id = se.validated_data.get("product_sku")
            supplier_id = se.validated_data.get("supplier_code")
            
            print(se.validated_data.get("price"))
            print(se.validated_data)

            price, icreated = Pricelist.objects.get_or_create(
					price=se.validated_data.get("price"),
					stock=se.validated_data.get("stock"),
                    product_id=se.validated_data.get("product_sku"),
                    supplier_id=se.validated_data.get("supplier_code"))

            price.save()

            payload = PriceReadSerializer(price).data
            
            #payload = {"success":True}

            ret = BaseResponse()
            ret.setStatus(status.HTTP_201_CREATED)
            ret.setMessage('pricelist has been created')
            return ret.info(payload)

        payload = se.errors
        ret = BaseResponse()
        ret.setStatus(status.HTTP_400_BAD_REQUEST)
        ret.setSuccess(False)
		
        return ret.info(payload)