FROM composer:2.6 as build

WORKDIR /app

COPY composer.json composer.lock ./
RUN composer install --no-dev --no-scripts --prefer-dist

COPY . .

RUN apk update && apk add --no-cache curl gnupg zip unzip nodejs npm

RUN npm install && npm run build

RUN php artisan config:cache
RUN php artisan route:cache

FROM php:8.2-cli

WORKDIR /app
COPY --from=build /app /app

CMD php artisan serve --host=0.0.0.0 --port=10000
