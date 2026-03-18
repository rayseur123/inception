# Inception
*This project was created as part of the 42 curriculum by njooris*

# Description
## Overview
This project introduces us to the DevOps workflow using Docker.
The goal is to set up a fully functional web environment using multiple services (Docker, Nginx, MariaDB).

## Docker
Docker is a tool for managing containers—isolated environments for single applications.
The main advantage is portability: you can ensure that your workspace is identical to your colleague’s, regardless of the host system.

### Containers
A container can be seen as an isolated application.
It contains everything needed to run: code, dependencies, libraries, configuration files, etc.

### Details
In this project, we are tasked with setting up a set of containers to deploy a WordPress website.
Each container runs a specific service:

- MariaDB: Acts as the database manager, responsible for storing, reading, and writing persistent data.
The data will be stored in a Docker volume to ensure it persists even if the container is removed.

- Nginx: Serves as the web server. It is lightweight, fast, and shares a volume with the WordPress container to access the web pages to display.

- Wordpress : WordPress: WordPress itself does not require a separate container. Its files are stored in the volume shared with Nginx.
The WordPress processes are executed via PHP-FPM, acting as a CGI for Nginx.

---

### Conteneur vs Machine virtuelle
- A virtual machine simulates a full operating system with all its components.
- A container includes only what is necessary to run its dedicated application, making it lighter and faster to start.

---

### Volumes
Volumes are used to store persistent data.
They are attached to containers and ensure that data is preserved even if a container is removed.
Volumes are especially useful for databases.

---

### Volumes vs Bind mount
There are two main ways to persist data in Docker: volumes and bind mounts.
- Volume: Fully managed by Docker and stored in a dedicated location on the host (usually /var/lib/docker/volumes).
Docker handles its lifecycle: creation, removal, and isolation.
- Bind mount: Links a folder or file from the host system to a path inside the container.
Data remains entirely controlled by the host, not by Docker.

---

### Images
An image is a preconfigured template used to create containers.
It is the core unit for sharing containers: anyone can use an image to create an identical container.
Images in Docker are immutable, meaning they serve as a fixed blueprint to launch containers.

---

### Dockerfile
A Dockerfile is composed of a sequence of instructions (FROM, RUN, COPY, etc.).
Each instruction creates a layer, which is immutable once built.
This allows Docker to cache layers and speed up rebuilds: if a later layer changes, only that layer and the ones above it are rebuilt.

---

### .env
Docker supports environment variables, which can be passed individually or grouped in a .env file.
Environment variables simplify and centralize service configuration.

---

### .secret
Secrets are special environment variables that are not shared (for example in a repository).
To access a secret, the path must be specified explicitly.
Secrets are used to store confidential information globally, such as passwords or API keys.

---

### Docker compose
Docker Compose est un outil permettant de gérer un ensemble de services répartis dans plusieurs conteneurs.
Il fournit plusieurs commandes pour gérer vos conteneurs sans avoir à les manipuler individuellement.

---

### Docker networking
Docker provides a virtual network system for containers.
This allows containers to communicate with each other.

Docker includes an internal DNS, which resolves service names to container IPs.
Thus, a container can reach another container simply by using its service name (e.g., database, backend) instead of the IP.

# Instructions

```
make                # General purpose make command (depends on project setup)
```

```
make setup          # Sets up the full environment (.env, volumes, .secrets, etc.)
```

```
make build          # Builds the Docker images
```

```
make setup          # Sets up the full environment (.env, volumes, .secrets, etc.)
```

```
make stop           # Stops the running containers
```

```
make down           # Stops and removes the active containers
```

```
make clean          # Removes containers, images, and volumes
```

```
make re             # Cleans everything and rebuilds the full environment
```

# Resources

Most of the information about Docker was found in the official documentation:  
https://docs.docker.com/

For each service, their respective documentation was used:  
[MariaDB](https://mariadb.com/docs)  
[Wordpress](https://wordpress.org/documentation/)  
[nginx](https://nginx.org/en/docs/)

To understand what a CGI is:
https://www.ionos.fr/digitalguide/sites-internet/developpement-web/quest-ce-que-la-cgi/

For FastCGI, Wikipedia was sufficient: 
https://en.wikipedia.org/wiki/FastCGI

To configure the nginx.conf file:  
https://www.ionos.fr/digitalguide/hebergement/blogs/installer-wordpress-sur-nginx/

For package management on Alpine Linux:  
https://wiki.alpinelinux.org/wiki/Alpine_Package_Keeper

AI was used to complement these resources, clarify certain concepts, and verify that best practices were correctly applied.

