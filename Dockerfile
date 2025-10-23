# Use the official PHP image with Apache
FROM php:8.2-apache

# Copy all project files into the Apache document root
COPY . /var/www/html/

# Set working directory
WORKDIR /var/www/html/

# Give Apache permission to write to uploads folder
RUN mkdir -p uploads && chmod -R 777 uploads

# Expose port 8080 (Render expects this)
EXPOSE 8080

# Apache runs on port 80 by default, so we remap it
CMD ["apache2-foreground"]
