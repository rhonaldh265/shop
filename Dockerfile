# Use the official PHP image with Apache
FROM php:8.2-apache

# Copy project files into Apache directory
COPY . /var/www/html/

# Set working directory
WORKDIR /var/www/html/

# Make uploads writable
RUN mkdir -p uploads && chmod -R 777 uploads

# Tell Apache to listen on port 8080 (Render requirement)
RUN sed -i 's/80/8080/g' /etc/apache2/ports.conf /etc/apache2/sites-available/000-default.conf

# Expose 8080 for Render
EXPOSE 8080

# Start Apache in foreground
CMD ["apache2-foreground"]
