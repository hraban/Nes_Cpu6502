NAME := Nes_Cpu6502

$(NAME): source/main.c
	$(CC) $< -o $@ $$(pkg-config --libs --cflags sdl3)

.PHONY:
clean:
	rm -rf $(NAME)
