# Stage 1: Build Vue with Vite
FROM node:18 AS node_builder

WORKDIR /app
COPY package*.json vite.config.ts ./
COPY resources ./resources
COPY public ./public
RUN npm install
RUN npm run build

# Stage 2: Laravel setup
FROM php:8.2-fpm AS php_builder

RUN apt-get update && apt-get install -y \
    zip unzip git curl libsqlite3-dev libzip-dev \
    && docker-php-ext-install pdo pdo_sqlite zip

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

WORKDIR /var/www
COPY . .

RUN composer install --no-dev --optimize-autoloader

# Copy built Vite assets
COPY --from=node_builder /app/public /var/www/public
COPY --from=node_builder /app/resources/js/pages /var/www/resources/js/pages

# Ensure SQLite database file exists
RUN mkdir -p database && touch database/database.sqlite

# Set proper permissions
RUN chown -R www-data:www-data storage bootstrap/cache

# Stage 3: Production container with NGINX
FROM php:8.2-fpm

# Install Nginx and dependencies
RUN apt-get update && apt-get install -y nginx libsqlite3-dev libzip-dev unzip \
    && docker-php-ext-install pdo pdo_sqlite zip

WORKDIR /var/www

# Copy application from build stage
COPY --from=php_builder /var/www /var/www

# Copy Nginx config
COPY nginx/default.conf.template /etc/nginx/conf.d/default.conf.template

# Copy and set startup script
COPY nginx/start.sh /start.sh
RUN chmod +x /start.sh

# Expose dynamic port for Render
ENV PORT=10000
EXPOSE 10000

# Start Nginx and PHP-FPM
CMD ["/start.sh"]
