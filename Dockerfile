FROM php:7.2-fpm
WORKDIR "/app"
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y libz-dev libpq-dev && apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*
RUN docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql && docker-php-ext-install pdo pgsql pdo_pgsql zip
