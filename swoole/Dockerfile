ARG BASE_VERSION=latest

FROM ghcr.io/addeeandra/php-xdebug:$BASE_VERSION

# install swoole
RUN pecl install swoole-5.1.2 \
    docker-php-ext-enable swoole \
    pecl clear-cache