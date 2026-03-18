
# Developper Documentation

## Prerequisites

Before starting, make sure you have the following installed:

- Docker
- Docker Compose
- Make

---

## Configuration before launch

First, configure the database settings in the `.env` file located in `srcs/.env`.

Then, configure your credentials in the files located in `srcs/.secrets/*`.  
(Default values are provided in the Makefile.)

### List of secrets
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

## Build and Run

Use the Makefile to manage the project:
```
make # Setup and start all services
make up # Start services
make down # Stop services
make clean # Remove containers, images, and volumes
```
Docker Compose is used internally to orchestrate the containers.

---

## Useful Docker Commands

```
docker ps # List running containers
docker logs <container_name> # Show container logs
docker images # List images
docker exec -it <container> sh # Access a running container
```

---

## Useful Docker Compose Commands

```
docker compose build # Build service images
docker compose up # Start and create containers if needed
docker compose down # Stop containers
docker compose down -v # Remove containers and associated volumes
```
These commands are mainly for debugging. Prefer using the Makefile.

## Data Persistence

Data is stored using bind mounts.

- MariaDB stores its database data in a directory on the host
- WordPress shares files with Nginx through a bind-mounted directory

All data is located on the host in:
`/home/njooris/data/*`
Since bind mounts are directly linked to the host filesystem, the data persists even if containers are removed.
