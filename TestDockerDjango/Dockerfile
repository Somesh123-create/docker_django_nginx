# django/Dockerfile

FROM python:3.10

ENV PYTHONUNBUFFERED 1

# Copy the application code to the container
COPY . /app

# Set the working directory
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    netcat-openbsd \
    build-essential \
    default-libmysqlclient-dev \
    pkg-config \
    && rm -rf /var/lib/apt/lists/*

# Create a virtual environment
RUN python3 -m venv /opt/venv

# Install dependencies and make scripts executable
RUN /opt/venv/bin/pip install --upgrade pip && \
    /opt/venv/bin/pip install -r requirements.txt && \
    chmod +x celery_start_entrypoint.sh && \
    chmod +x celerybeat_start_entrypoint.sh && \
    chmod +x migrate.sh && \
    chmod +x check_mysql_up.sh

# Set the script as the entrypoint
ENTRYPOINT ["/app/check_mysql_up.sh", "amuraa_mysql", "3306", "sh /app/migrate.sh"]
