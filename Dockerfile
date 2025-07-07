FROM php:8.2-fpm

# Install system dependencies
RUN apt-get update && apt-get install -y \
    nginx \
    unzip \
    curl \
    git \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libonig-dev \
    libxml2-dev \
    libzip-dev \
    sqlite3 \
    libsqlite3-dev \
    zip \
    supervisor \
    gettext \  
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install pdo pdo_mysql pdo_sqlite mbstring exif pcntl bcmath gd

# Install Composer
COPY --from=composer:2.7 /usr/bin/composer /usr/bin/composer

# Create SQLite DB and set permissions
# RUN mkdir -p /var/www/html/database && \
#     touch /var/www/html/database/database.sqlite && \
#     chown -R www-data:www-data /var/www/html/database && \
#     chmod -R 775 /var/www/html/database

# Copy app source
COPY . /var/www/html

# Set working directory
WORKDIR /var/www/html

# Set permissions
RUN chown -R www-data:www-data /var/www/html && chmod -R 755 /var/www/html

# Copy Nginx config
COPY conf/nginx/nginx-site.conf /etc/nginx/sites-available/default

# Copy Supervisor config
COPY conf/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Copy Nginx template config
COPY conf/nginx/nginx-site.conf.template /etc/nginx/templates/nginx-site.conf.template

# Copy Laravel deploy script
COPY scripts/00-laravel-deploy.sh /usr/local/bin/laravel-deploy.sh
RUN chmod +x /usr/local/bin/laravel-deploy.sh

# Start container
COPY scripts/start.sh /usr/local/bin/start.sh
RUN chmod +x /usr/local/bin/start.sh

# Expose port
EXPOSE ${PORT}

CMD ["bash", "/usr/local/bin/start.sh"]
