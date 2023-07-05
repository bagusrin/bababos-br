from django.urls import path, include
from rest_framework import routers
from .views import CustomerView

router = routers.DefaultRouter()
router.register(r'', CustomerView, 'customer')


urlpatterns = [
    path(r'', include(router.urls)),
]
