CC = gcc

build: main.c border_detection.c border_detection.h
	@ $(CC) main.c border_detection.c -o border_detection -lm

clean: border_detection
	@ rm border_detection