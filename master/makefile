CC = mpicc

build: main.c border_detection.c border_detection.h
	@ $(CC) mpicc border_detection.c main.c -o border_detection -lm -fopenmp

clean: border_detection
	@ rm border_detection
	@ rm -r output_images/*
	@ rm -r report/out/*
	@ rm -r report/plots/*