from datetime import datetime
from django.conf import settings
from rest_framework import mixins, viewsets, status
from rest_framework.decorators import action
from rest_framework.response import Response
from rest_framework.permissions import AllowAny
from django.http import Http404
from src.db.models import Fleet
from src.app.fleet.serializers import FleetReadSerializer, FleetPostSerializer
from src.utils.response import BaseResponse

class FleetView(mixins.CreateModelMixin, mixins.UpdateModelMixin, mixins.RetrieveModelMixin, viewsets.GenericViewSet):
    permission_classes = [AllowAny,]
    serializer_class = FleetPostSerializer
    queryset = Fleet.objects.filter(deleted_at__isnull=True)
    
    def get_serializer_class(self, ):
        if self.action == 'list' or self.action == 'retrieve':
            return FleetReadSerializer
        return FleetPostSerializer
    
    def get_queryset(self):
        name = self.request.GET.get('name')
        #print(name)
        return self.queryset.filter(deleted_at__isnull=True,name=name) if name else self.queryset
     
    def create(self, request, *args, **kwargs):
        se = self.get_serializer(data=request.data)
        print(se)
        
        if se.is_valid():
            type = se.validated_data.get("type")
            capacity = se.validated_data.get("capacity")
            unit = se.validated_data.get("unit")

            fleet, icreated = Fleet.objects.get_or_create(
					type=type,
					capacity=capacity,
                    unit=unit)

            fleet.save()

            payload = FleetReadSerializer(fleet).data

            ret = BaseResponse()
            ret.setStatus(status.HTTP_201_CREATED)
            ret.setMessage('fleet has been created')
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