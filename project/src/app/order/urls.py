from django.urls import path, include
from rest_framework import routers
from .views import OrderView

router = routers.DefaultRouter()
router.register(r'', OrderView, 'order')


urlpatterns = [
    path(r'', include(router.urls)),
]
