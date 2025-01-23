#!/bin/bash

# Exit on error
set -e

# Wait for the database to be ready
echo "Waiting for database to be ready..."
until nc -z "$POSTGRES_HOST" "$POSTGRES_PORT"; do
  sleep 0.1
done

# Run migrations before starting the app
echo "Running database migrations..."
uv run manage.py migrate

# Start the appropriate server
if [ "$DEBUG" = "True" ]; then
    echo "Starting Django development server..."
    exec uv run manage.py runserver 0.0.0.0:8000
else
    echo "Starting Gunicorn server..."
    exec gunicorn --bind 0.0.0.0:8000 config.wsgi:application
fi
