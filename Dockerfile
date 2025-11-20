FROM php:8.2-apache

# Copia el código del proyecto al contenedor
COPY . /var/www/html/

# Instala las extensiones necesarias para MySQL y PDO
RUN docker-php-ext-install pdo pdo_mysql mysqli

# Asigna permisos correctos
RUN chown -R www-data:www-data /var/www/html

# Expone el puerto 80 para el servidor Apache
EXPOSE 80
