NAME = inception

SECRETS_DIR = /home/njooris/inception/srcs/.secrets
ENV_FILE = /home/njooris/inception/srcs/.env

all: setup
	cd srcs/ ; docker compose up --build -d

setup:
	@echo "setup";
	@mkdir -p /home/njooris/data/db
	@mkdir -p /home/njooris/data/wordpress

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

up:
	cd srcs/ ; docker compose up

stop:
	cd srcs/ ; docker compose stop

down:
	cd srcs/ ; docker compose down

clean: down
	cd srcs/ ; docker system prune -af
	sudo rm -rf /home/njooris/data/db/*
	sudo rm -rf /home/njooris/data/wordpress/*

re: clean all

.PHONY: all setup stop down clean re

