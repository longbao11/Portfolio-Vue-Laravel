# ---------- Build Stage ----------
FROM composer:2.6 as build

WORKDIR /app

COPY composer.json composer.lock ./
RUN composer install --no-dev --no-scripts --prefer-dist

COPY . .

RUN apk add --no-cache curl gnupg zip unzip nodejs npm
RUN npm install && npm run build
