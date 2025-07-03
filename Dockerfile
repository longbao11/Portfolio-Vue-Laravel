# ---------- Build Stage ----------
FROM composer:2.6 as build

WORKDIR /app

# Install PHP dependencies
COPY composer.json composer.lock ./
RUN composer install --no-dev --prefer-dist

# Copy source code
COPY . .

# Install Node.js + build frontend (Vite + Inertia)
RUN apk add --no-cache curl gnupg zip unzip nodejs npm
RUN npm install && npm run build

# Laravel optimization
RUN php artisan config:cache && php artisan route:cache


# ---------- Runtime Stage ----------
FROM php:8.2-cli

WORKDIR /app
COPY --from=build /app /app

# Install required PHP extensions for SQLite and Laravel
RUN apt-get update && apt-get install -y \
    libzip-dev \
    libsqlite3-dev \
    unzip \
    zip \
    && docker-php-ext-install zip pdo pdo_sqlite

# Startup: create DB, run migrations, serve app
CMD bash -c "\
    mkdir -p database && \
    touch database/database.sqlite && \
    php artisan migrate --force && \
    php artisan serve --host=0.0.0.0 --port=10000"
