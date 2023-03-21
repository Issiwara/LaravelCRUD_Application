FROM php:7.2.5
RUN apt-get update -y && apt-get install -y openssl zip unzip git
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN docker-php-ext-install pdo_mysql
WORKDIR /app
COPY . /app
RUN composer install

CMD php artisan serve --host=54.236.45.216 --port=8000
EXPOSE 8000
