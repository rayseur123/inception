# Inception
*This project was created as part of the 42 curriculum by njooris*

# Description
## Overview
This project introduces us to the DevOps workflow using Docker.
The goal is to set up a fully functional web environment using multiple services (Docker, Nginx, MariaDB).

## Docker
Docker is a tool for managing containers—isolated environments for single applications.
The main advantage is portability: you can ensure that your workspace is identical to your colleague’s, regardless of the host system.

### Details
In this project, we are tasked with setting up a set of containers to deploy a WordPress website.
Each container runs a specific service:

- MariaDB: Acts as the database manager, responsible for storing, reading, and writing persistent data.
The data will be stored in a Docker volume to ensure it persists even if the container is removed.

- Nginx: Serves as the web server. It is lightweight, fast, and shares a volume with the WordPress container to access the web pages to display.

- Wordpress : WordPress: WordPress itself does not require a separate container. Its files are stored in the volume shared with Nginx.
The WordPress processes are executed via PHP-FPM, acting as a CGI for Nginx.

### Volume
A volume is used to store persistent data.
Even if a container is removed and recreated multiple times, a volume ensures that important data remains intact.

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


