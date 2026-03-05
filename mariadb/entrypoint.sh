#!/bin/sh

DB_PWD="test123"

if [ ! -d "$DATA_DIR/mysql" ]; then
    mariadb-install-db --user=mysql --datadir="$DATA_DIR"

    mariadbd --datadir="$DATA_DIR" &

    until mariadb-admin ping -h 127.0.0.1 --silent; do
        sleep 0.1
    done

    mariadb -h 127.0.0.1 -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_PWD';"
    mariadb -h 127.0.0.1 -u root -e "CREATE DATABASE IF NOT EXISTS $DB_NAME;"
    mariadb -h 127.0.0.1 -u root -e "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PWD';"
    mariadb -h 127.0.0.1 -u root -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';"
    mariadb -h 127.0.0.1 -u root -e "FLUSH PRIVILEGES;"

    pkill -f mariadbd
fi

exec mariadbd --user=mysql --datadir="$DATA_DIR"

