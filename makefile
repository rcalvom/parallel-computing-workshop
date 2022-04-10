CC = gcc

build: main.c border_detection.c border_detection.h
	@ $(CC) main.c border_detection.c -o border_detection -lm -pthread

clean: border_detection
	@ rm border_detection
	@ rm -r output_images/*
	@ rm -r report/out/*
	@ rm -r report/plots/*