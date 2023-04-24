# Makefile for docker compose

DC = docker compose
DC_DIR = ./srcs
DC_FILE = $(DC_DIR)/docker-compose.yml

VOLM_DIR=./srcs/data
VOLM_DB=$(VOLM_DIR)/db
VOLM_WP=$(VOLM_DIR)/wp

all:
	mkdir -p $(VOLM_DB) $(VOLM_WP)
	$(DC) -f $(DC_FILE) up -d --build

up:
	$(DC) -f $(DC_FILE) up -d

down:
	$(DC) -f $(DC_FILE) down

re:
	$(DC) -f $(DC_FILE) down
	$(DC) -f $(DC_FILE) build
	$(DC) -f $(DC_FILE) up -d

logs:
	$(DC) -f $(DC_FILE) logs -f

ps:
	$(DC) -f $(DC_FILE) ps

clean:
	$(DC) -f $(DC_FILE) down --rmi all --remove-orphans

fclean:
	$(DC) -f $(DC_FILE) down -v --rmi all --remove-orphans
	rm -rf $(VOLM_DIR)

.PHONY: all build up down logs ps clean fclean
