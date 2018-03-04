##
## EPITECH PROJECT, 2018
## asm
## File description:
## asm
##

CC	=	gcc

CFLAGS  =       -m64 -Ofast -fPIC

LFLAGS	=	-shared

NASM	=	nasm

ASMFLAGS	=	-felf64

NAME	=	libasm.so

SRC	=	src/strlen.asm				\
		src/strcmp.asm				\
		src/strncmp.asm				\
		src/strcasecmp.asm			\
		src/strcpy.asm				\
		src/strchr.asm				\
		src/memset.asm				\
		src/memcpy.asm				\
		src/memmove.asm				\
		src/rindex.asm				\
		src/strcspn.asm

OBJ	=	$(SRC:.asm=.o)

RM	=	rm -f

all:	$(NAME)

$(NAME):	$(OBJ)
	$(CC) $(CFLAGS) $(OBJ) -o $(NAME) $(LFLAGS)

clean:
	$(RM) $(OBJ)

fclean:	clean
	$(RM) $(NAME)

re:	fclean all

%.o: %.asm
	$(NASM) $(ASMFLAGS) $<

.PHONY:	all clean fclean re
