from datetime import datetime
from django.conf import settings
from rest_framework import mixins, viewsets, status
from rest_framework.decorators import action
from rest_framework.response import Response
from rest_framework.permissions import AllowAny
from django.http import Http404
from src.db.models import Customer
from src.app.customer.serializers import CustomerReadSerializer, CustomerPostSerializer
from src.utils.response import BaseResponse

class CustomerView(mixins.CreateModelMixin, mixins.UpdateModelMixin, mixins.RetrieveModelMixin, viewsets.GenericViewSet):
	permission_classes = [AllowAny,]
	serializer_class = CustomerPostSerializer
	queryset = Customer.objects.filter(deleted_at__isnull=True)
	lookup_field = 'code'

	def get_serializer_class(self, ):
		if self.action == 'list' or self.action == 'retrieve':
			return CustomerReadSerializer
		return CustomerPostSerializer

	def get_queryset(self):
		name = self.request.GET.get('name')
		#print(name)
		return self.queryset.filter(deleted_at__isnull=True,name=name) if name else self.queryset
     
	def create(self, request, *args, **kwargs):
		se = self.get_serializer(data=request.data)

		if se.is_valid():
			code = se.validated_data.get("code")
			address = se.validated_data.get("address")
			city = se.validated_data.get("city")
			state = se.validated_data.get("state")

			customer, icreated = Customer.objects.get_or_create(
					code=code,
					address=address,
					city=city,
     				state=state)

			customer.save()

			payload = CustomerReadSerializer(customer).data

			ret = BaseResponse()
			ret.setStatus(status.HTTP_201_CREATED)
			ret.setMessage('customer has been created')
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