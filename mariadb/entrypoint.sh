#!/bin/sh

if [ ! -d "/var/lib/mysql/mysql" ]; then
    db_pwd=$(cat /run/secrets/db_password)
    mariadb-install-db --datadir=/var/lib/mysql --user=mysql

    cat << EOF > /tmp/init.sql
FLUSH PRIVILEGES;
CREATE DATABASE IF NOT EXISTS \`${DB_NAME}\`;
CREATE USER IF NOT EXISTS \`${DB_USER}\`@'%' IDENTIFIED BY '${db_pwd}';
GRANT ALL PRIVILEGES ON \`${DB_NAME}\`.* TO \`${DB_USER}\`@'%';
ALTER USER 'root'@'localhost' IDENTIFIED BY '${db_pwd}';
FLUSH PRIVILEGES;
EOF

    mariadbd --datadir=/var/lib/mysql --bootstrap < /tmp/init.sql
fi

exec mariadbd --datadir=/var/lib/mysql
