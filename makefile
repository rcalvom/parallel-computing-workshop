CC = gcc
CU = nvcc

build: main.c border_detection.cu border_detection.h
	@ $(CC) -c main.c -lm
	@ $(CU) -c border_detection.cu -lm -arch=sm_35
	@ $(CU) -o border_detection main.o border_detection.o -arch=sm_35

clean: border_detection
	@ rm border_detection
	@ rm -r output_images/*
	@ rm -r report/out/*
	@ rm -r report/plots/*