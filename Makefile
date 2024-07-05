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

$(NAME): start

start:
	mkdir -p $(DATA)

clean:
	rm -rf $(DATA)