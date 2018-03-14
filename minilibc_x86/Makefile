##
## EPITECH PROJECT, 2018
## asm
## File description:
## asm
##

CC	=	ld

CFLAGS  =       -m elf_i386

LFLAGS	=	-shared

NASM	=	nasm

ASMFLAGS	=	-felf32

NAME	=	libasm.so

SRC	=	src/strlen.asm					\
		src/strcpy.asm					\
		src/strcmp.asm					\
		src/strncmp.asm					\
		src/strcasecmp.asm				\
		src/memcpy.asm					\
		src/memset.asm					\
		src/memmove.asm					\
		src/rindex.asm					\
		src/strchr.asm					\
		src/strcspn.asm					\
		src/strpbrk.asm					\
		src/strstr.asm					\
		src/write.asm					\
		src/read.asm

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