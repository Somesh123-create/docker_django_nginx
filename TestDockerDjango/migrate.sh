#!/bin/sh
cd /app/

# Apply migrations
echo "Applying migrations..."
/opt/venv/bin/python manage.py makemigrations --noinput
echo "Applying migrate..."
/opt/venv/bin/python manage.py migrate --noinput

# Collect static files
echo "Collecting static files..."
/opt/venv/bin/python manage.py collectstatic --noinput


# Create superuser if it doesn't exist
echo "Creating superuser if it doesn't exist..."
/opt/venv/bin/python manage.py shell -c "
from django.contrib.auth import get_user_model;
User = get_user_model();
if not User.objects.filter(username='admin').exists():
    User.objects.create_superuser('admin', 'admin@example.com', 'adminpassword')
"

APP_PORT=${PORT:-8000}
/opt/venv/bin/gunicorn --worker-tmp-dir /dev/shm amuraa.wsgi:application --bind "0.0.0.0:${APP_PORT}"
