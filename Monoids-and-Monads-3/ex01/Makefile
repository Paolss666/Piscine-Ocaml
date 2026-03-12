NAME = ex01

COMPILER = ocamlopt

SRCS_PATH = ./src/

SRC = app.ml main.ml

OBJS_PATH = ./obj/

CMX = $(SRC:.ml=.cmx)
OBJS = $(addprefix $(OBJS_PATH), $(CMX))
SRCS = $(addprefix $(SRCS_PATH), $(SRC))

all: $(OBJS_PATH) $(NAME)

$(OBJS_PATH):
	mkdir -p $(OBJS_PATH)

$(OBJS_PATH)%.cmx: $(SRCS_PATH)%.ml
	$(COMPILER) -c -o $@ $< -I $(OBJS_PATH)

$(NAME): $(OBJS)
	$(COMPILER) $(OBJS) -o $@

clean:
	rm -rf $(OBJS_PATH) ./src/.*.ml.swp

fclean: clean
	rm -rf $(NAME)

re: fclean all

.PHONY: all clean fclean re
