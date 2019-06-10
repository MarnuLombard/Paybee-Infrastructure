#!/bin/bash

PROJECT_PATH=/var/www/html

# install dependancies and warm laravel cache 
cd $PROJECT_PATH \
    && composer install --verbose --prefer-dist --optimize-autoloader --no-progress --no-interaction --no-dev \
    && chmod -R 755 storage/ \
    && php artisan config:cache \
    && php artisan view:cache \
    && php artisan route:cache \
    && php artisan migrate

# Run default php:fpm container process
php-fpm