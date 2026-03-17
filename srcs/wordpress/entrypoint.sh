#!/bin/sh

cd /var/www/html

DB_PWD=$(cat /run/secrets/db_password)
ADMIN_USR=$(cat /run/secrets/wp_admin_user)
ADMIN_PWD=$(cat /run/secrets/wp_admin_pwd)
ADMIN_EMAIL=$(cat /run/secrets/wp_admin_mail)
USER_USR=$(cat /run/secrets/wp_user_user)
USER_PWD=$(cat /run/secrets/wp_user_pwd)
USER_EMAIL=$(cat /run/secrets/wp_user_mail)

if [ ! -f "wp-config.php" ]; then
    cp wp-config-sample.php wp-config.php

    sed -i "s|database_name_here|$DB_NAME|g" wp-config.php
    sed -i "s|username_here|$DB_USER|g" wp-config.php
    sed -i "s|password_here|$DB_PWD|g" wp-config.php
    sed -i "s|localhost|mariadb|g" wp-config.php

fi

if ! wp core is-installed; then
	wp core install \
	--url=njooris.42.fr \
	--title="Inception" \
	--admin_user=$ADMIN_USR \
	--admin_password=$ADMIN_PWD \
	--admin_email=$ADMIN_EMAIL \
	--skip-email \
	--allow-root
	
	wp user create $USER_USR $USER_EMAIL \
	--role=author \
	--user_pass=$USER_PWD \
	--allow-root
fi

exec php-fpm83 -F

