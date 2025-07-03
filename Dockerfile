FROM composer:2.6 as build

WORKDIR /app

COPY composer.json composer.lock ./
RUN composer install --no-dev --no-scripts --prefer-dist

COPY . .

RUN apt-get update && apt-get install -y curl gnupg zip unzip
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash -
RUN apt-get install -y nodejs
RUN npm install && npm run build

RUN php artisan config:cache
RUN php artisan route:cache

FROM php:8.2-cli

WORKDIR /app
COPY --from=build /app /app

CMD php artisan serve --host=0.0.0.0 --port=10000
