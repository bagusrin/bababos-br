from django.urls import path, include
from rest_framework import routers
from .views import PriceView

router = routers.DefaultRouter()
router.register(r'', PriceView, 'price')


urlpatterns = [
    path(r'', include(router.urls)),
]
