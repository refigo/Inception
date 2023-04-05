# Makefile for docker compose

DC = docker compose
DC_DIR = ./srcs/
DC_FILE = $(DC_DIR)docker-compose.yml

build:
	$(DC) -f $(DC_FILE) build

up:
	$(DC) -f $(DC_FILE) up -d

down:
	$(DC) -f $(DC_FILE) down

logs:
	$(DC) -f $(DC_FILE) logs -f

ps:
	$(DC) -f $(DC_FILE) ps

clean:
	$(DC) -f $(DC_FILE) down --remove-orphans

fclean:
	$(DC) -f $(DC_FILE) down -v --rmi all --remove-orphans

.PHONY: build up down logs ps clean fclean
