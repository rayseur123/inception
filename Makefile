NAME = inception

SECRETS_DIR = srcs/.secrets/
ENV_FILE = srcs/.env

all: setup
	cd srcs/ ; docker compose up --build -d

setup:
	@echo "setup";
	@mkdir -p ~/data/db
	@mkdir -p ~/data/wordpress
	@mkdir -p $(SECRETS_DIR)

	@if [ ! -f $(SECRETS_DIR)/db_password.txt ]; then \
		echo "dbPassoword" > $(SECRETS_DIR)/db_password.txt; \
	fi

	@if [ ! -f $(SECRETS_DIR)/wp_admin_user.txt ]; then \
		echo "njooris" > $(SECRETS_DIR)/wp_admin_user.txt; \
	fi

	@if [ ! -f $(SECRETS_DIR)/wp_admin_password.txt ]; then \
		echo "password" > $(SECRETS_DIR)/wp_admin_password.txt; \
	fi

	@if [ ! -f $(SECRETS_DIR)/wp_admin_mail.txt ]; then \
		echo "njooris.njooris@hotmail.fr" > $(SECRETS_DIR)/wp_admin_mail.txt; \
	fi

	@if [ ! -f $(SECRETS_DIR)/wp_user_user.txt ]; then \
		echo "nseon" > $(SECRETS_DIR)/wp_user_user.txt; \
	fi

	@if [ ! -f $(SECRETS_DIR)/wp_user_password.txt ]; then \
		echo "password" > $(SECRETS_DIR)/wp_user_password.txt; \
	fi

	@if [ ! -f $(SECRETS_DIR)/wp_user_mail.txt ]; then \
		echo "nseon@nseon.fr" > $(SECRETS_DIR)/wp_user_mail.txt; \
	fi

	@if [ ! -f $(ENV_FILE) ]; then \
		echo "DB_NAME=MyDataBase" >> $(ENV_FILE); \
		echo "DB_USER=db_user" >> $(ENV_FILE); \
		echo "DATA_DIR=/var/lib/mysql" >> $(ENV_FILE); \
		echo "DB_HOST=mariadb" >> $(ENV_FILE); \
	fi

build:
	cd srcs/ ; docker compose build

up:
	cd srcs/ ; docker compose up -d

stop:
	cd srcs/ ; docker compose stop

down:
	cd srcs/ ; docker compose down

clean:
	cd srcs/ ; docker compose down -v
	cd srcs/ ; docker system prune -af --volumes
	sudo rm -rf /home/njooris/data/db/*
	sudo rm -rf /home/njooris/data/wordpress/*

re: clean all

.PHONY: all setup build up stop down clean re

