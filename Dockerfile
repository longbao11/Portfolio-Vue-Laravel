# Stage 1: Build Vue with Vite
FROM node:18 as node_builder

WORKDIR /app
COPY package*.json vite.config.ts ./
COPY resources ./resources
COPY public ./public
RUN npm install
RUN npm run build

# Stage 2: Laravel setup
FROM php:8.2-fpm as php_builder

RUN apt-get update && apt-get install -y \
    zip unzip git curl libsqlite3-dev libzip-dev \
    && docker-php-ext-install pdo pdo_sqlite zip

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

WORKDIR /var/www

COPY . .
RUN composer install --no-dev --optimize-autoloader

# Copy built Vite assets
COPY --from=node_builder /app/public /var/www/public
COPY --from=node_builder /app/resources/js/Pages /var/www/resources/js/Pages

# Set proper permissions
RUN chown -R www-data:www-data storage bootstrap/cache

# Stage 3: Production container
FROM php:8.2-fpm

WORKDIR /var/www
COPY --from=php_builder /var/www /var/www

CMD ["php-fpm"]
