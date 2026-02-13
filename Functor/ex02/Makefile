NAME = ex02

COMPILER = ocamlopt


SRCS_PATH = ./src/

SRC = ex02.ml
SRCS = $(addprefix $(SRCS_PATH), $(SRC))

OBJS_PATH = ./obj/

CMX = $(SRC:.ml=.cmx)

OBJS = $(addprefix $(OBJS_PATH), $(CMX))

all: $(OBJS_PATH) $(NAME)

$(OBJS_PATH):
	mkdir -p $(OBJS_PATH)

$(OBJS_PATH)%.cmx: $(SRCS_PATH)%.ml
	$(COMPILER) -c -o $@ $<  -I $(OBJS_PATH)

$(NAME): $(OBJS)
	$(COMPILER) unix.cmxa $(OBJS) -o $@ 

clean:
	rm -rf $(OBJS_PATH)

fclean: clean
	rm -rf $(NAME)

re: fclean all

.PHONY: all clean fclean re
