# Inception
*This project has been created as part of the 42 curriculum by njooris*

# Description
## Overview
Ce projet nous inicie au metier de devops en utilisant l'outil Docker.
Pour ce faire nous devont mettre en place un environement web grace a plusieurs services (Docker, nginx, MariaDB).

### Docker
Docker est un outil permettant la gestion de container ( des environnement isolé pour une seul application).
L'interet ici est de rendre portables des outils. Par exemple si vous voulez travailler sur un espace de travail similaire a votre collegue docker a un grand interet.

### Details
Dans ce projet nous allons devoir mettre en place un ensemble de containers permetant la mise en plce d'une page web wordpress.
Pour ce faire chaque containers devra contenir un service. 

- Mariadb : Mariadb sera notre gestionnaire de BDD permettant le stockage / la lecture / l'ecriture de données persistante. 
C'est donnée seront stocké dans un volume.

- Nginx : Ngninx sera notre server web. Il se veux leger et rapide et partagera son volume avec le container wordpress pour avoir acces au pages a afficher.

- Wordpress : Worpress n'a pas reelement un container a lui. Ses fichiers seront stockée dans le volume partagée avec nginx. Le process executée dans ce container sera alors un CGI plus précisement php-fpm.
