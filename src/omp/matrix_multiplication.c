/**
 * @file matrix_multiplication.c
 * @author Ricardo Andrés Calvo Méndez (rcalvom@unal.edu.co)
 * @author Jorge Aurelio Morales Manrique (jomorales@unal.edu.co)
 * @brief Perform matrix multiplication.
 * @version 1.0
 * @date 2022-06-06
 * 
 * @copyright Copyright (c) 2022
 * 
 */

// Standard library
#include <stdlib.h>

// Standard input/output library
#include <stdio.h>

// Time library
#include <time.h>

// System time library
#include <sys/time.h>

// System wait library
#include <sys/wait.h>

// Open mp library
#include <omp.h>

// Matrix multiplication library
#include "matrix_multiplication.h"

/**
 * @brief Perform Matrix multiplication
 * 
 * @param matrix_a_filename First matrix for multiplication
 * @param matrix_b_filename Second matrix for multiplication
 * @param matrix_b_filename Produced matrix by multiplication
 * @param matrix_size Matrix size
 * @param thread_count Number of Threds executed
 */
void matrix_multiplication(char * matrix_a_filename, char* matrix_b_filename, char* matrix_c_filename, int matrix_size, int thread_count){

    /**
     * @brief Load matrices from files
     * 
     */
    int* matrix_a = read_matrix(matrix_a_filename, matrix_size);
    int* matrix_b = read_matrix(matrix_b_filename, matrix_size);

    /**
     * @brief Multiply matrices
     * 
     */
    int* matrix_c = multiply_matrices(matrix_a, matrix_b, matrix_size, thread_count);

    /**
     * @brief Save result
     * 
     */
    save_matrix(matrix_c, matrix_c_filename, matrix_size);

    /**
     * @brief Free Allocated Memory
     * 
     */
    free(matrix_a);
    free(matrix_b);
    free(matrix_c);
}

/**
 * @brief Load Matrix from TXT file.
 * Columns are separated by spaces
 * Rows are separated by new lines
 * 
 * @param matrix_filename Matrix filename
 * @param matrix_size Matrix size
 * @return Matrix Readed
 */
int* read_matrix(char* matrix_filename, int matrix_size){
    int* matrix = malloc(sizeof(int) * matrix_size * matrix_size);
    if(matrix == NULL){
        perror("The memory couldn't be allocated. Aborting");
        exit(EXIT_FAILURE);
    }
    FILE* file = fopen(matrix_filename, "r");
    if(file == NULL){
        perror("The file couldn't be opened. Aborting");
        exit(EXIT_FAILURE);
    }
    for(int i = 0; i < matrix_size * matrix_size; i++){
        fscanf(file, "%i", matrix + i);
    }
    fclose(file);
    return matrix;
}

/**
 * @brief Multiply two matrices A and B
 * 
 * @param matrix_a Matrix A
 * @param matrix_b Matrix B
 * @param matrix_size Matrix size
 * @param thread_count Number of Threads to excecute
 * @return Matrix C (A * B)
 */
int* multiply_matrices(int* matrix_a, int* matrix_b, int matrix_size, int thread_count){
    int* matrix_c = malloc(sizeof(int) * matrix_size * matrix_size);
    if(matrix_c == NULL){
        perror("The memory couldn't be allocated. Aborting");
        exit(EXIT_FAILURE);
    }
    for(int index = 0; index < matrix_size * matrix_size; index++){
        int i = index / matrix_size;
        int j = index % matrix_size;
        int value = 0;
        for(int k = 0; k < matrix_size; k++){
            value += *(matrix_a + ( i * matrix_size) + k) * *(matrix_b + (matrix_size * k) + j);
        }
        *(matrix_c + (i * matrix_size) + j) = value;
    }
    return matrix_c;
}

/**
 * @brief Save a given matrix to a file
 * 
 * @param matrix Matrix to save
 * @param matrix_filename File to write
 * @param matrix_size Matrix size
 */
void save_matrix(int* matrix, char* matrix_filename, int matrix_size){
    FILE* file = fopen(matrix_filename, "w+");
    if(file == NULL){
        perror("The file couldn't be created. Aborting");
        exit(EXIT_FAILURE);
    }
    for(int i = 0; i < matrix_size; i++){
        for(int j = 0; j < matrix_size; j++){
            fprintf(file, "%i ", *(matrix + (i * matrix_size) + j));
        }
        fprintf(file, "\n");
    }
    fclose(file);
}






