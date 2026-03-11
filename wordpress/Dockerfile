FROM alpine:3.23

RUN apk add --no-cache \
    wget \
    php83 \
    php83-fpm \
    php83-mysqli \
    php83-json \
    php83-curl \
    php83-dom \
    php83-exif \
    php83-fileinfo \
    php83-mbstring \
    php83-openssl \
    php83-xml \
    php83-zip \
 && mkdir -p /var/www/html \
 && cd /tmp \
 && wget https://wordpress.org/latest.tar.gz \
 && tar -xzf latest.tar.gz \
 && mv wordpress/* /var/www/html \
 && rm -rf wordpress latest.tar.gz

COPY --chmod=+x entrypoint.sh /entrypoint.sh

RUN sed -i "s|listen = 127.0.0.1:9000|listen = 9000|g" /etc/php83/php-fpm.d/www.conf

EXPOSE 9000

ENTRYPOINT ["/entrypoint.sh"]

