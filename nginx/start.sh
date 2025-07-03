#!/bin/sh

# Replace ${PORT} in the Nginx conf with actual env var
envsubst '$PORT' < /etc/nginx/conf.d/default.conf > /etc/nginx/conf.d/default.conf.tmp
mv /etc/nginx/conf.d/default.conf.tmp /etc/nginx/conf.d/default.conf

nginx -g 'daemon off;'
