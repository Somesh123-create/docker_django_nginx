"""
ASGI config for amuraa project.

It exposes the ASGI callable as a module-level variable named ``application``.

For more information on this file, see
https://docs.djangoproject.com/en/5.1/howto/deployment/asgi/
"""

import os
from dotenv import load_dotenv
load_dotenv(".env")
from django.core.asgi import get_asgi_application

os.getenv('DJANGO_SETTINGS_MODULE')

application = get_asgi_application()
