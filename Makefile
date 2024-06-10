all: setup
	sudo mkdir -p /home/inicole-/data/mysql
	docker volume create --name mariadb_volume --opt type=none --opt device=/home/inicole-/data/mysql --opt o=bind
	sudo mkdir -p /home/inicole-/data/wordpress
	docker volume create --name wordpress_volume --opt type=none --opt device=/home/inicole-/data/wordpress --opt o=bind
	docker-compose -f ./srcs/docker-compose.yml up -d --build

setup:
	sudo grep -q inicole- /etc/hosts || sudo sed -i "3i127.0.0.1\tinicole-.42.fr" /etc/hosts

up:
	sudo docker-compose -f ./srcs/docker-compose.yml up --build --detach

down:
	sudo docker-compose -f ./srcs/docker-compose.yml down

fclean: down
	docker system prune --all --force --volumes
	docker volume rm mariadb_volume wordpress_volume
	sudo rm -fr /home/inicole-/data

.PHONY: all setup up down fclean