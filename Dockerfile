FROM composer:2.6 as build

WORKDIR /app

COPY composer.json composer.lock ./
RUN composer install --no-dev --no-scripts --prefer-dist

COPY . .

RUN apk update && apk add --no-cache curl gnupg zip unzip nodejs npm

RUN npm install && npm run build

# Laravel config + route caching
RUN php artisan config:cache
RUN php artisan route:cache

# ✅ Create SQLite file during build (optional — safer in final image)
# RUN mkdir -p database && touch database/database.sqlite

FROM php:8.2-cli

WORKDIR /app
COPY --from=build /app /app

# ✅ Install Laravel dependencies in runtime image too
RUN apt-get update && apt-get install -y unzip libzip-dev && docker-php-ext-install zip pdo pdo_sqlite

# ✅ Create the SQLite file, run migrations when the container starts
CMD bash -c "\
    mkdir -p database && \
    touch database/database.sqlite && \
    php artisan migrate --force && \
    php artisan serve --host=0.0.0.0 --port=10000"
