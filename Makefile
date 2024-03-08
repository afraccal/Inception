NAME = Inception
SRC_DIR =srcs
ENV = $(SRC_DIR)/.env
YML = $(SRC_DIR)/docker-compose.yml
USER = afraccal

DC = docker-compose
RM = rm -rf
MD = mkdir -p

VOLUMES = $(sudo docker volume ls -q)

all: $(NAME)

clean: stop
	sudo docker system prune -a -f

fclean: clean vol_clean dir_clean

re: fclean reload

reload:	
	@ $(DC) --env-file $(ENV) -f $(YML) up --build

host:
	@ sudo echo "127.0.0.1 $(USER).42.fr" >> etc/hosts

$(NAME):
	@if [ ! -d /home/${MY_USER}/data ]; then \
	mkdir -p /home/${MY_USER}/data/wordpress ; \
	mkdir -p /home/${MY_USER}/data/mariadb ; \
	mkdir -p /home/${MY_USER}/data/adminer ; \
	fi
	sudo docker-compose -f ./srcs/docker-compose.yml --env-file "./srcs/.env" up --build

stop:
	$(DC) -f $(YML) --env-file $(ENV) down

vol_clean:
	@ sudo docker volume rm $(VOLUMES)

dir_clean: 
	@ $(RM) /home/$(USER)/data
	@ $(MD) /home/$(USER)/data
	@ $(MD) /home/$(USER)/data/wordpress
	@ $(MD) /home/$(USER)/data/mariadb

.PHONY: start stop host all clean fclear re reload vol_clean dir_clean