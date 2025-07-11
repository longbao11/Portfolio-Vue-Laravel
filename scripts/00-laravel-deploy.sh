#!/bin/bash

echo "Running composer..."
composer install --no-dev --working-dir=/var/www/html

echo "Caching config..."
php artisan config:cache

echo "Caching routes..."
php artisan route:cache

echo "Publishing cloudinary provider..."
php artisan vendor:publish --provider="CloudinaryLabs\CloudinaryLaravel\CloudinaryServiceProvider" --tag="cloudinary-laravel-config" || true

echo "Running migrations..."
# Only run migrate if the DB is empty (no users table)
if ! php artisan migrate:status | grep -q 'users'; then
  php artisan migrate --force
else
  echo "Migrations already applied. Skipping."
fi
