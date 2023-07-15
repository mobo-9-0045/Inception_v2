# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: aomman <marvin@42.fr>                      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/06/06 20:23:53 by aomman            #+#    #+#              #
#    Updated: 2023/06/06 20:23:54 by aomman           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

.PHONY: up down re clean

all : up

down:
	@docker-compose -f srcs/docker-compose.yml down
up:
	@docker-compose -f srcs/docker-compose.yml up --build

fclean :
	@docker volume rm $(docker volume ls -q) &> /dev/null ; true
re : clean up

