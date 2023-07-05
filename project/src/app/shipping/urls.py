from django.urls import path, include
from rest_framework import routers
from .views import ShippingView

router = routers.DefaultRouter()
router.register(r'', ShippingView, 'shipping')


urlpatterns = [
    path(r'', include(router.urls)),
]
