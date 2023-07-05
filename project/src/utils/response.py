from rest_framework.response import Response
from rest_framework import status

class BaseResponse():
    
    status = 200
    success = True
    data = None
    message = None
    
    def __init__(self, status = status, success = success):
        self.status = status
        self.success = success
        
    def setStatus(self, status):
        self.status = status
        
    def setSuccess(self, success):
        self.success = success

    def setMessage(self, message):
        self.message = message
    
    def info(self, data):
        
        self.data = data
        
        payload = {
            "status": self.status,
			"success": self.success,
            "message": self.message
        }
        
        if self.success:
            payload["data"] = self.data
        else:
            payload["message"] = self.data
        
        return Response(payload, self.status)
    