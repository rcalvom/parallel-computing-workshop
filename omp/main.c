/**
 * @file main.c
 * @author Ricardo Andrés Calvo Méndez (rcalvom@unal.edu.co)
 * @author Jorge Aurelio Morales Manrique (jomorales@unal.edu.co)
 * @brief Project Excecutable
 * @version 1.0
 * @date 2022-06-06
 * 
 * @copyright Copyright (c) 2022
 * 
 */

// Standard library
#include <stdlib.h>

// Error control library
#include <errno.h>

// Standard input/output library
#include <stdio.h>

// Matrix multiplication library
#include "matrix_multiplication.h"


int main(int argc, char* argv[]){

    if(argc != 6){
        perror("The program has not enought arguments. Aborting.");
        exit(EXIT_FAILURE);
    }

    char* matrix_a_filename = argv[1];
    char* matrix_b_filename = argv[2];
    char* matrix_c_filename = argv[3];
    int matrix_size = atoi(argv[4]);
    int thread_count = atoi(argv[5]);
    
    matrix_multiplication(matrix_a_filename, matrix_b_filename, matrix_c_filename, matrix_size, thread_count);

    return 0;
}