from django.urls import path, include
from rest_framework import routers
from .views import QuotationView

router = routers.DefaultRouter()
router.register(r'', QuotationView, 'quotation')


urlpatterns = [
    path(r'', include(router.urls)),
]
