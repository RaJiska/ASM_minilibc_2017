##
## EPITECH PROJECT, 2018
## asm
## File description:
## asm
##

PROJECT	=	minilibc

NAME	=	libasm.so

X64_DIR	=	x64

X86_DIR	=	x86

BIN_DIR	=	bin

LN	=	ln -sf

RM	=	rm -f

all:	$(PROJECT)_$(X64_DIR) $(PROJECT)_$(X86_DIR)

$(NAME): $(NAME)_$(X64_DIR)

$(PROJECT)_$(X64_DIR):
	$(MAKE) -C $(PROJECT)_$(X64_DIR)
	$(LN) $(PROJECT)_$(X64_DIR)/$(NAME) .
	$(LN) ../$(PROJECT)_$(X64_DIR)/$(NAME) $(BIN_DIR)/x64_$(NAME)

$(PROJECT)_$(X86_DIR):
	$(MAKE) -C $(PROJECT)_$(X86_DIR)
	$(LN) $(PROJECT)_$(X86_DIR)/$(NAME) .
	$(LN) ../$(PROJECT)_$(X86_DIR)/$(NAME) $(BIN_DIR)/x86_$(NAME)

clean:
	$(MAKE) -C $(PROJECT)_$(X64_DIR) clean
	$(MAKE) -C $(PROJECT)_$(X86_DIR) clean

fclean:
	$(MAKE) -C $(PROJECT)_$(X64_DIR) fclean
	$(MAKE) -C $(PROJECT)_$(X86_DIR) fclean
	$(RM) $(NAME) $(BIN_DIR)/x64_$(NAME) $(BIN_DIR)/x86_$(NAME)

re:	fclean all

.PHONY:	all $(PROJECT)_$(X64_DIR) $(PROJECT)_$(X86_DIR) clean fclean re
