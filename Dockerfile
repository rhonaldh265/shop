# Use official PHP + Apache image
FROM php:8.2-apache

# Set working directory
WORKDIR /var/www/html

# Copy project files
COPY . /var/www/html

# Make uploads directory writable
RUN mkdir -p uploads && chmod -R 777 uploads

# Force Apache to listen on port 8080 (Render requirement)
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf \
    && sed -i 's/80/8080/g' /etc/apache2/ports.conf /etc/apache2/sites-available/000-default.conf

# Expose 8080 for Render
EXPOSE 8080

# Start Apache
CMD ["apache2-foreground"]
