CC=gcc
FLAGS=-Wall -Wextra -Wundef -Wshadow -Wpointer-arith -Wcast-align -Wstrict-prototypes -Wstrict-overflow=4 -Wwrite-strings -Waggregate-return -Wcast-qual -Wswitch-default -Wswitch-enum -Wconversion -Wunreachable-code -lSDL2 -lSDL2_ttf -g

main: main.o
		$(CC) -o ted main.c -I. $(FLAGS)

