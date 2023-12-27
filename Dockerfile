# Use the PHP Apache base image
FROM php:7.4-apache

# Expose port 80 for Apache
EXPOSE 80

# Copy your web application files to the appropriate directory
COPY ./src/ /var/www/html/

# Install MySQL client and mysqli extension
RUN apt-get update && \
    apt-get install -y default-mysql-client && \
    docker-php-ext-install mysqli

# Enable Apache modules
RUN a2enmod rewrite

# Set the MySQL environment variables
# ENV MYSQL_ROOT_PASSWORD=rootpassword
# ENV MYSQL_DATABASE=db
# ENV MYSQL_USER=root
# ENV MYSQL_PASSWORD=IronMan3000

# Start the Apache service
CMD apachectl -D FOREGROUND
