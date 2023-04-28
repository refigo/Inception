NAME = Inception

DC = docker compose
DC_FILE = ./srcs/docker-compose.yml

VOLM_DIR=${HOME}/data
VOLM_DB=$(VOLM_DIR)/db
VOLM_WP=$(VOLM_DIR)/wp

all: $(NAME)

$(NAME):
	mkdir -p $(VOLM_DB) $(VOLM_WP)
	$(DC) -f $(DC_FILE) up -d

down:
	$(DC) -f $(DC_FILE) down

re:
	$(DC) -f $(DC_FILE) down
	$(DC) -f $(DC_FILE) build
	$(DC) -f $(DC_FILE) up -d

build:
	$(DC) -f $(DC_FILE) build

logs:
	$(DC) -f $(DC_FILE) logs -f

ps:
	$(DC) -f $(DC_FILE) ps

restart:
	$(DC) -f $(DC_FILE) restart

clean:
	$(DC) -f $(DC_FILE) down --rmi all --remove-orphans

fclean:
	$(DC) -f $(DC_FILE) down -v --rmi all --remove-orphans
	sudo rm -rf $(VOLM_DIR)

.PHONY: all down re logs ps restart clean fclean
