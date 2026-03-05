#!/bin/sh

if [ ! -d "/var/lib/mysql/mysql" ]; then
	mariadb-install-db --user=mysql --datadir=/var/lib/mysql
	db_pwd="test123"
	mariadbd --datadir=/var/lib/mysql &
	until mariadb-admin ping -h 127.0.0.1 -u root &> /dev/null; do
		sleep 0.1
	done

	 mariadb -h 127.0.0.1 -u root -e "CREATE DATABASE myDataBase"
	 mariadb -h 127.0.0.1 -u root -e "CREATE USER 'njooris'@'%' IDENTIFIED BY '$db_pwd'"
	 mariadb -h 127.0.0.1 -u root -e "GRANT ALL PRIVILEGES ON myDataBase.* TO 'njooris'@'%';"
	 mariadb -h 127.0.0.1 -u root -e "FLUSH PRIVILEGES;"
	 mariadb-admin -u root shutdown

fi
exec mariadbd --user=mysql --datadir=/var/lib/mysql
