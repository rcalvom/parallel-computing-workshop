/**
 * @file main.c
 * @author Ricardo Andrés Calvo Méndez (rcalvom@unal.edu.co)
 * @author Jorge Aurelio Morales Manrique (jomorales@unal.edu.co)
 * @brief Project Excecutable
 * @version 1.0
 * @date 2022-06-19
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

// Time library
#include <time.h>

// System time library
#include <sys/time.h>

// System wait library
#include <sys/wait.h>

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

    if(argc != 5){
        perror("The program has not enought arguments. Aborting.");
        exit(EXIT_FAILURE);
    }

    char* input_filename = argv[1];
    char* output_filename = argv[2];
    double filter_intensity = atof(argv[3]);
    int process_count = atoi(argv[4]);
    
    struct timeval start, end;
    double stopwatch;
    gettimeofday(&start, NULL);

    border_detection_filter(input_filename, output_filename, filter_intensity, process_count);

    gettimeofday(&end, NULL);
    stopwatch = (double)(end.tv_sec + (double) end.tv_usec / 1000000) - (double)(start.tv_sec + (double) start.tv_usec / 1000000);

    printf("The program has finished sucessfully.\n");
    printf("Time execution: %f\n", stopwatch);

    return 0;
}