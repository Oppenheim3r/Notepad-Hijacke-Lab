FROM php:8.2-apache

# Enable SSL module and default SSL site
RUN a2enmod ssl && a2ensite default-ssl

# Copy SSL certificates
COPY server.crt /etc/ssl/certs/server.crt
COPY server.key /etc/ssl/private/server.key

# Update Apache SSL configuration to use our self-signed certs
RUN sed -i 's|/etc/ssl/certs/ssl-cert-snakeoil.pem|/etc/ssl/certs/server.crt|g' /etc/apache2/sites-available/default-ssl.conf && \
    sed -i 's|/etc/ssl/private/ssl-cert-snakeoil.key|/etc/ssl/private/server.key|g' /etc/apache2/sites-available/default-ssl.conf

# Set working directory
WORKDIR /var/www/html

# Copy lab files
COPY ./www/ /var/www/html/

# Ensure correct permissions
RUN chown -R www-data:www-data /var/www/html && \
    chmod -R 755 /var/www/html

# Expose ports
EXPOSE 80
EXPOSE 443
