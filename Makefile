# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tlassere <tlassere@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/03/13 16:29:01 by tlassere          #+#    #+#              #
#    Updated: 2024/05/03 12:32:49 by tlassere         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME	::= inception
DATA	::= /home/tlassere/data

all: $(NAME)

$(NAME): build start

start:
	mkdir -p $(DATA)
	docker compose -f ./srcs/docker-compose.yml up

build:
	docker compose -f ./srcs/docker-compose.yml build

delete-all:
	docker rmi -f `docker images -aq`
	docker rm -vf `docker ps -aq`

clean:
	rm -rf $(DATA)