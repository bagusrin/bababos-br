from rest_framework.views import exception_handler
from rest_framework import serializers, exceptions, status

def custom_exception_handler(exc, context):
    # Call REST framework's default exception handler first,
    # to get the standard error response.
    response = exception_handler(exc, context)

    # Now add the HTTP status code to the response.
    if response is not None:
        response.data['status'] = response.status_code
        response.data['success'] = False
        response.data['message'] = response.data['detail']
        
        del response.data['detail']

    return response

class FooException(exceptions.ValidationError):
    status_code = status.HTTP_400_BAD_REQUEST
