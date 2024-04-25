FROM php:8.2

RUN pecl channel-update https://pecl.php.net/channel.xml\
    && pecl install xdebug

RUN pecl clear-cache

COPY ./10-xdebug.ini /usr/local/etc/php/conf.d/10-xdebug.ini