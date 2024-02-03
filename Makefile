# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: apaula-l <apaula-l@student.42sp.org.br>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/11/14 13:02:25 by apaula-l          #+#    #+#              #
#    Updated: 2024/02/03 03:33:59 by apaula-l         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libftprintf.a
INCS := ./ Libft/
CC = cc
CFLAGS = -Wall -Wextra -Werror -Ofast
CPPFLAGS := $(addprefix -I,$(INCS)) -MMD -MP
LDLIBS := -lft
LIBFT_DIR = Libft/

SRCS = ft_printf.c
OBJS = $(SRCS:.c=.o)

BONUS = ft_printf_bonus.c
BOBJS = $(BONUS:.c=.o)

LIBFT = Libft/libft.a
LIBFT_HEADER = libft
MAKE_LIBFT = make -C Libft

all: $(LIBFT) $(NAME)

$(NAME): $(OBJS)
	cp $(LIBFT) $(NAME)
	ar -rcs $(NAME) $(OBJS)

%.o: %.c
	$(CC) $(CFLAGS) $(CPPFLAGS) -c $< -o $@

$(LIBFT):
	$(MAKE_LIBFT)

bonus:	$(BOBJS) $(LIBFT)
	cp $(LIBFT) $(NAME)
	ar rcs $(NAME) $(BOBJS)

clean:
	rm -f $(OBJS) $(BOBJS)
	rm -f $(OBJS)
	$(MAKE_LIBFT) clean

fclean: clean
	rm -f $(NAME)
	$(MAKE_LIBFT) fclean

re: fclean all

.PHONY: clean fclean re all bonus