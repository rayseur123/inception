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
Un conteneur peut être vu comme une application isolée.
Il contient tout ce dont elle a besoin pour fonctionner : le code, les dépendances, les bibliothèques, les fichiers de configuration, etc.


### Details
In this project, we are tasked with setting up a set of containers to deploy a WordPress website.
Each container runs a specific service:

- MariaDB: Acts as the database manager, responsible for storing, reading, and writing persistent data.
The data will be stored in a Docker volume to ensure it persists even if the container is removed.

- Nginx: Serves as the web server. It is lightweight, fast, and shares a volume with the WordPress container to access the web pages to display.

- Wordpress : WordPress: WordPress itself does not require a separate container. Its files are stored in the volume shared with Nginx.
The WordPress processes are executed via PHP-FPM, acting as a CGI for Nginx.

---

### Conteneur
Un conteneur peut être vu comme une **application isolée**.  
Il contient tout ce dont elle a besoin pour fonctionner : le code, les dépendances, les bibliothèques, les fichiers de configuration, etc.

---

### Conteneur vs Machine virtuelle
- Une **machine virtuelle** simule un système d’exploitation complet avec tous ses composants.  
- Un **conteneur** n’inclut que ce qui est nécessaire pour exécuter l’application qui lui est dédiée, ce qui le rend plus léger et rapide à lancer.

---

### Volumes
Les volumes permettent de stocker des données **persistantes**.  
Ils se connectent aux conteneurs et permettent de conserver les informations même si le conteneur est supprimé.  
Ils sont particulièrement utiles pour les bases de données.

---

### Volumes vs Bind mount
Il existe deux façons principales de persister des données avec Docker : les volumes et les bind mounts.
- **Un volume** est **géré directement par Docker**. Il est stocké dans un emplacement spécifique sur le host (souvent dans /var/lib/docker/volumes).
Docker s’occupe entièrement de sa gestion (création, suppression, isolation).

- **Un bind mount** consiste à lier un dossier ou fichier du host à un chemin dans le conteneur.
Ici, les données restent entièrement contrôlées par le **système hôte, pas par Docker.**

---

### Images
Une image est un fichier permettant de créer un conteneur **préconfiguré**.  
C’est le cœur du partage des conteneurs : on distribue une image, et chacun peut créer un conteneur identique à partir de celle-ci.  
Dans l’écosystème Docker, une image sert de modèle **immuable** pour lancer des conteneurs.

---

### Dockerfile
Un Dockerfile est constitué d’une succession d’instructions (FROM, RUN, COPY, etc.).
Chaque instruction crée une couche (layer).

---

### .env
Des variables d'environnement sont disponible sur Docker. Elles peuvent etre passé au compose une par une ou bien fournir un fichier .env qui les regroupent.
Les variables d'environnement permettent de simplifier et de coordonner la coffigurations des services.

---

### .secret
Les secrets on pour vocation d'etre des variable d'environnement qui ne seront pas partagé dans un partage (sur un repo par exemples). Pour y acceder il faudra specifié le path contrairement au variable d'environnement. 
Les secrets sont utilisé pour stocké des informations global confidentiel comme des mots de passe ou des identifiants.

---

### Docker compose
Docker Compose est un outil permettant de gérer un ensemble de services répartis dans plusieurs conteneurs.
Il fournit plusieurs commandes pour gérer vos conteneurs sans avoir à les manipuler individuellement.

---

### Docker networking
Docker propose un système de réseau virtuel entre les conteneurs.
C’est grâce à cet outil que l’on peut connecter les conteneurs entre eux et leur permettre de communiquer.

Docker intègre un DNS interne qui permet de remplacer les adresses IP par les noms de services.
Ainsi, un conteneur peut accéder à un autre simplement en utilisant son nom (ex : database, backend, etc.), sans avoir besoin de connaître son IP.

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


