FROM php:7.4-fpm

RUN curl -s https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer

RUN apt-get update && apt-get install -y zip git libzip-dev && \
	docker-php-ext-configure zip --with-libzip && docker-php-ext-install zip pdo pdo_mysql

RUN pecl install xdebug-2.8.1 && docker-php-ext-enable xdebug && \
	echo "xdebug.remote_enable=1" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini

