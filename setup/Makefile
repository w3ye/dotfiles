OS := $(shell uname)
SCRIPT ?=

ifeq ($(OS),Darwin)
	SCRIPT = ./mac.zsh
endif

install: $(SCRIPT)
