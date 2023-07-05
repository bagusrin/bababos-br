from django.urls import path, include
from rest_framework import routers
from .views import ProductView

router = routers.DefaultRouter()
router.register(r'', ProductView, 'product')


urlpatterns = [
    path(r'', include(router.urls)),
]
