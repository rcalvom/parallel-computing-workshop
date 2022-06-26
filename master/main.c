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

// Open mpi library
#include <mpi.h>

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
    char* grayscale_filename = argv[2];
    char* output_filename = argv[3];
    double filter_intensity = atof(argv[4]);
    int process_count = atoi(argv[5]);


    int id;
    MPI_Init(&argc, &argv);

    MPI_Comm_rank(MPI_COMM_WORLD, &id);

    MPI_Barrier(MPI_COMM_WORLD);
    double start = MPI_Wtime();
    
    border_detection_filter(input_filename, grayscale_filename, output_filename, filter_intensity, process_count);

    MPI_Barrier(MPI_COMM_WORLD);
    double end = MPI_Wtime();

    MPI_Finalize();

    if(id == 0){
        printf("The program has finished sucessfully.\n");
        printf("Time execution: %f\n", end - start);
    }
    
    return 0;
}