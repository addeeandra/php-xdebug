ARG PHP_VERSION=8.3

FROM php:$PHP_VERSION-cli-alpine

# install xdebug + swoole
RUN pecl install xdebug-3.3.2 \
    docker-php-ext-enable xdebug \
    pecl clear-cache

# configure composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# configure xdebug
COPY ./10-xdebug.ini /usr/local/etc/php/conf.d/10-xdebug.ini