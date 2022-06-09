CC = gcc
CU = nvcc

build: main.c matrix_multiplication.cu matrix_multiplication.h
	@ $(CC) -c main.c -lm
	@ $(CU) -c matrix_multiplication.cu -lm -arch=sm_35
	@ $(CU) -o matrix_multiplication main.o matrix_multiplication.o -arch=sm_35

clean: matrix_multiplication
	@ rm matrix_multiplication
	@ rm -r output_matrices/*
	@ rm -r out/*