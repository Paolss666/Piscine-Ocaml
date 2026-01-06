NAME = ex00

COMPILER = ocamlopt

INC_PATH = ./incl/
INC = -I $(INC_PATH)

SRCS_PATH = ./src/
SRC = ackermann.ml
SRCS = $(addprefix $(SRCS_PATH), $(SRC))

OBJS_PATH = ./obj/
CMX = $(SRC:.ml=.cmx)
OBJS = $(addprefix $(OBJS_PATH), $(CMX))

all: $(OBJS_PATH) $(NAME)

$(OBJS_PATH):
	mkdir -p $(OBJS_PATH)

$(OBJS_PATH)%.cmx: $(SRCS_PATH)%.ml
	$(COMPILER) -c -o $@ $< $(INC)

$(NAME): $(OBJS)
	$(COMPILER) $(OBJS) -o $@ $(INC)

clean:
		rm -rf $(OBJS_PATH)

fclean:
		rm -rf $(NAME) $(OBJS_PATH)
	
re: fclean
		make all

.PHONY: all clean fclean re
