#!/bin/sh

# Start Celery worker
echo "Starting Celery worker..."
/opt/venv/bin/celery -A amuraa worker --loglevel=info
