import random
import string

def randomString():
    return ''.join(random.choices(string.ascii_lowercase, k=5))