from rest_framework.response import Response
from src.utils.response import BaseResponse
from django.http import HttpResponse, QueryDict, JsonResponse

import json

class AuthenticateMiddleware(object):
    
    def __init__(self, get_response):
        self.get_response = get_response
        
    def __call__(self, request):
        
        try:
            auth_key = request.headers.get('X-API-KEY')
            print(auth_key)
            
            if auth_key == '1234':
                return self.get_response(request)
            else:
                return JsonResponse({'status': 400,'success': False, 'message': 'Authentication failed'}, status=400)
        except json.JSONDecodeError:
            return JsonResponse({'status': 400,'success': False, 'message': 'Authentication failed'}, status=400)
            
    
    def process_exception(self, request, exception):
        
        return JsonResponse({'status': 400,'success': False, 'message': 'Authentication failed'}, status=400)