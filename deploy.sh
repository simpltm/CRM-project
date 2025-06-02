#!/bin/bash

cd /home/ubuntu/CRM-project

echo "--- Pulling latest code ---"
git pull origin main

echo "--- Building docker ---"
docker-compose down
docker-compose up --build -d

echo "--- Collect static (if needed) ---"
docker-compose exec web python manage.py collectstatic --noinput

echo "--- Done ---"

