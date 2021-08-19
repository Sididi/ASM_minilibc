##
## EPITECH PROJECT, 2018
## ASM_minilibc_2017
## File description:
## Makefile
##

NASM 		=	nasm
LD  		=	ld
RM			=	rm -f

NASMFLAGS 	+=	-f elf64 -Ox

LDFLAGS 	+=	-shared

NAME 		=	libasm.so

SRC 		=	$(addprefix src/,	\
					strlen.asm 		\
					strchr.asm 		\
					memset.asm  	\
					memcpy.asm 		\
					strcmp.asm 		\
					strncmp.asm 	\
					rindex.asm 		\
					strcasecmp.asm 	\
					memmove.asm 	\
					strstr.asm   	\
					strpbrk.asm 	\
					strcspn.asm 	\
				)

OBJ  		=	$(SRC:.asm=.o)

all: $(NAME)

$(NAME): $(OBJ)
	$(LD) $(LDFLAGS) -o $@ $^

clean:
	$(RM) $(OBJ)

fclean: clean
	$(RM) $(NAME)

re: fclean all

%.o: %.asm
	$(NASM) $< $(NASMFLAGS)

.PHONY: all clean fclean re