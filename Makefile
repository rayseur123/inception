NAME = inception

all: setup
	cd srcs/ ; docker-compose -f srcs/compose.yaml up --build -d

setup:
	@mkdir -p /home/njooris/data/db
	@mkdir -p /home/njooris/data/wordpress

stop:
	cd srcs/ ; docker-compose -f srcs/compose.yaml stop

down:
	cd srcs/ ; docker-compose -f srcs/compose.yaml down

clean: down
	cd srcs/ ; docker system prune -af
	sudo rm -rf /home/njooris/data/db/*
	sudo rm -rf /home/njooris/data/wordpress/*

re: clean all

.PHONY: all setup stop down clean re
