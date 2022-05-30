/**
 * @file main.c
 * @author Ricardo Andrés Calvo Méndez (rcalvom@unal.edu.co)
 * @author Jorge Aurelio Morales Manrique (jomorales@unal.edu.co)
 * @brief Project Excecutable
 * @version 1.0
 * @date 2022-05-30
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

// Border detection library
#include "border_detection.h"

/**
 * @brief Main Method. Process a given picture with a border detection filter.
 * 
 * @param argc Number of input arguments
 * @param argv Array of imput arguments
 * @return Exit status
 */
int main(int argc, char* argv[]){

    if(argc != 6){
        perror("The program has not enought arguments. Aborting.");
        exit(EXIT_FAILURE);
    }

    char* input_filename = argv[1];
    char* output_filename = argv[2];
    double filter_intensity = atof(argv[3]);
    int block_count = atoi(argv[4]);
    int thread_count = atoi(argv[5]);
    
    border_detection_filter(input_filename, output_filename, filter_intensity, block_count, thread_count);

    return 0;
}