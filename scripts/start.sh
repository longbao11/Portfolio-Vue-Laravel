#!/bin/bash
set -e

# Replace ${PORT} in nginx conf using envsubst
envsubst '${PORT}' < /etc/nginx/templates/nginx-site.conf.template > /etc/nginx/sites-available/default

# Laravel setup
/usr/local/bin/laravel-deploy.sh

# Start Supervisor
exec /usr/bin/supervisord -n

