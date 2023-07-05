"""
URL configuration for project project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.http import JsonResponse
from django.urls import path,include

from django.contrib.auth.decorators import login_required
from rest_framework import permissions
from drf_yasg.views import get_schema_view
from drf_yasg import openapi

admin.autodiscover()

def error404(request, exception=None):
    return JsonResponse({
        'status_code': 404,
        'success': False,
        'message': 'The resource was not found'
    }, status=404)
    
def error400(request, exception=None):
    return JsonResponse({
        'status_code': 400,
        'success': False,
        'message': 'The resource was not found'
    }, status=400)

def error500(request, exception=None):
    return JsonResponse({
        'status_code': 500,
        'success': False,
        'message': 'Internal server error'
    }, status=500)

handler404 = error404
handler500 = error500

schema_view = get_schema_view(
   openapi.Info(
      title="API Bababos",
      default_version='v1',
      description="API for Bababos's App",
      terms_of_service="https://www.google.com/policies/terms/",
      contact=openapi.Contact(email="bagusrin.xyz@gmail.com"),
      license=openapi.License(name="BSD License"),
   ),
   #public=False,
   #permission_classes=(permissions.IsAuthenticated,),
)

urlpatterns = [
    path('admin/', admin.site.urls),
    path('customers/', include("src.app.customer.urls")),
    path('suppliers/', include("src.app.supplier.urls")),
    path('products/', include("src.app.product.urls")),
    path('fleets/', include("src.app.fleet.urls")),
    path('shippings/', include("src.app.shipping.urls")),
    path('prices/', include("src.app.pricelist.urls")),
    path('quotations/', include("src.app.quotation.urls")),
    path('history-orders/', include("src.app.order.urls")),
    path(r'docs/', schema_view.with_ui('swagger', cache_timeout=0), name='schema-swagger-ui')
]
