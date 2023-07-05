from django.urls import path, include
from rest_framework import routers
from .views import FleetView

router = routers.DefaultRouter()
router.register(r'', FleetView, 'product')


urlpatterns = [
    path(r'', include(router.urls)),
]
