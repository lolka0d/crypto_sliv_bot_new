"""
WSGI config for crypto_sliv_bot project.

It exposes the WSGI callable as a module-level variable named ``application``.

For more information on this file, see
https://docs.djangoproject.com/en/4.2/howto/deployment/wsgi/
"""

import os
import sys
from django.core.wsgi import get_wsgi_application

sys.path.append('/var/www/crypto_sliv_bot')
sys.path.append('/var/www/crypto_sliv_bot/crypto_sliv_bot')

#os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'crypto_sliv_bot.settings')
os.environ["DJANGO_SETTINGS_MODULE"] = "crypto_sliv_bot.settings"
application = get_wsgi_application()
