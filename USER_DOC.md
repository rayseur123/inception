# User Documentation

## What does this stack do?
This setup contains everything needed to run a basic WordPress website.  
It uses MariaDB as the database and Nginx as the web server.

---

## Configuration before launch
First, you need to configure the database information in the `.env` file located in `srcs/.env`.

Then, you need to configure your personal information in the files located in `srcs/.secrets/*`.  
(Default values are provided in the Makefile.)

### List of secrets to configure
```
db_password.txt : Database password

wp_admin_user.txt : WordPress admin username
wp_admin_password.txt : WordPress admin password
wp_admin_mail.txt : WordPress admin email

wp_user_user.txt : Default WordPress user username
wp_user_password.txt : Default WordPress user password
wp_user_mail.txt : Default WordPress user email
```

---

## Start / Stop the project

Here are the commands used to manage the project:
```
make : Sets up the environment and starts all services

make up : Starts the services

make down : Stops the services

make clean : Stops and removes all services, including persistent data
```

---

## Check if services are running correctly

When starting the services, logs will indicate whether everything is running properly.  
If you want to verify manually, you can use: ```docker ps```.

---

## Access the website

To access the website, you can either use:
 ```https://<host_ip>/``` Or configure your `/etc/hosts` file to assign a custom domain name, for example: ```njooris.42.fr```
 
To access the WordPress admin panel:
```https://<host_ip>/wp-admin```
