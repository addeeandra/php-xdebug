ARG PHP_VERSION=8.4.0RC2

FROM php:$PHP_VERSION-cli-alpine

ADD --chmod=0755 https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

RUN install-php-extensions xdebug-3.4.0beta1 @composer

# configure xdebug
COPY ./10-xdebug.ini /usr/local/etc/php/conf.d/10-xdebug.ini