#!/bin/bash
set -e

# Laravel setup
/usr/local/bin/laravel-deploy.sh

# Start Supervisor
exec /usr/bin/supervisord -n
