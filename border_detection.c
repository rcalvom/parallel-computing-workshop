/**
 * @file border_detection.c
 * @author Ricardo Andrés Calvo Méndez (rcalvom@unal.edu.co)
 * @author Jorge Aurelio Morales Manrique (jomorales@unal.edu.co)
 * @brief Process a picture with a border detection filter.
 * @version 1.0
 * @date 2022-04-05
 * 
 * @copyright Copyright (c) 2022
 * 
 */

// Posix threads library
#include <pthread.h>


void border_detection_filter(char* input_filename, char* output_filename, double filter_intensity, int threads_count){
    pthread_t tfd[threads_count];
    pthread_create(&tfd[i], NULL, border_detection_filter_thread, &data[i]);
}

void border_detection_filter_thread(const unsigned char** r_matrix, unsigned char** g_matrix, unsigned char** b_matrix){

}