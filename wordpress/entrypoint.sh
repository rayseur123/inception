#!/bin/sh

cd /var/www/html

DB_PWD=$(cat /run/secrets/db_password)

if [ ! -f "wp-config.php" ]; then
    echo "test11111111111"
    cp wp-config-sample.php wp-config.php

    sed -i "s|database_name_here|$DB_NAME|g" wp-config.php
    sed -i "s|username_here|$DB_USER|g" wp-config.php
    sed -i "s|password_here|$DB_PWD|g" wp-config.php
    sed -i "s|localhost|mariadb|g" wp-config.php

fi

sleep 10

if ! wp core is-installed; then
	echo "test222222222"
	wp core install \
	--url=njooris.42.fr \
	--title="Inception" \
	--admin_user=$WP_ADMIN_USR \
	--admin_password=$WP_ADMIN_PWD \
	--admin_email=$WP_ADMIN_EMAIL \
	--skip-email \
	--allow-root
	
	wp user create $WP_USER $WP_USER_EMAIL \
	--role=author \
	--user_pass=$WP_USER_PWD \
	--allow-root
fi

exec php-fpm83 -F

