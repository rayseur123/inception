#!/bin/sh

cd /var/www/html

if [ ! -f "wp-config.php" ]; then
    DB_PWD=$(cat /run/secrets/db_password)
    
    cp wp-config-sample.php wp-config.php
    
    sed -i "s|database_name_here|$DB_NAME|g" wp-config.php
    sed -i "s|username_here|$DB_USER|g" wp-config.php
    sed -i "s|password_here|$DB_PWD|g" wp-config.php
    sed -i "s|localhost|mariadb|g" wp-config.php
fi

exec php-fpm83 -F
