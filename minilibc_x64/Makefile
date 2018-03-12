##
## EPITECH PROJECT, 2018
## asm
## File description:
## asm
##

CC	=	gcc

LFLAGS	=	-shared -fno-builtin

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
		src/strpbrk.asm				\
		src/strcspn.asm				\
		src/strstr.asm				\
		src/read.asm				\
		src/write.asm

OBJ	=	$(SRC:.asm=.o)

RM	=	rm -f

all:	$(NAME)

$(NAME):	$(OBJ)
	$(CC) $(OBJ) -o $(NAME) $(LFLAGS)

clean:
	$(RM) $(OBJ)

fclean:	clean
	$(RM) $(NAME)

re:	fclean all

%.o: %.asm
	$(NASM) $(ASMFLAGS) $<

.PHONY:	all clean fclean re
