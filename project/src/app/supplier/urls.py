from django.urls import path, include
from rest_framework import routers
from .views import SupplierView

router = routers.DefaultRouter()
router.register(r'', SupplierView, 'supplier')


urlpatterns = [
    path(r'', include(router.urls)),
]
