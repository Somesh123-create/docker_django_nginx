#!/bin/sh

# Start Celery beat
echo "Starting Celery beat..."
/opt/venv/bin/celery -A amuraa beat --loglevel=info
