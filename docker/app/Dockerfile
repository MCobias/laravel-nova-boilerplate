# Set master image
FROM php:8-fpm

# Set working directory
WORKDIR /var/www/html

# Install selected extensions and other stuff
RUN apt-get update && apt-get install -y libzip-dev libicu-dev libpng-dev jpegoptim optipng pngquant git curl

# Add and Enable PHP-PDO Extenstions
RUN docker-php-ext-install pdo_mysql intl zip gd bcmath exif

# Enable xDebug remote
RUN	pecl install xdebug && docker-php-ext-enable xdebug

# Install PHP Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN mkdir -p ~/.composer && \
    chown -R www-data:www-data ~

# Add UID '1000' to www-data
RUN usermod -u 1000 www-data

# Copy existing application directory permissions
COPY --chown=www-data:www-data . /var/www/html

# Change current user to www
USER www-data

# Expose port 9000 and start php-fpm server
EXPOSE 9000
CMD ["php-fpm"]
