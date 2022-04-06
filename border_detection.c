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

// Standard input/output library
#include <stdio.h>

// Posix threads library
#include <pthread.h>


#include <string.h>

// Stb image library
#define STB_IMAGE_IMPLEMENTATION
#include "stb_image/stb_image.h"
#define STB_IMAGE_WRITE_IMPLEMENTATION
#include "stb_image/stb_image_write.h"

void border_detection_filter(char* input_filename, char* output_filename, double filter_intensity, int threads_count){
    int width, height, channels;
    unsigned char* image = stbi_load(input_filename, &width, &height, &channels, 3);
    if(image == NULL){
        perror("The image couldn't be readed. Aborting");
        exit(EXIT_FAILURE);
    }
    printf("width: %i\n", width);
    printf("heigth: %i\n", height);
    printf("channels: %i\n", channels);
    printf("data length: %li\n", strlen(image));
    /*pthread_t tfd[threads_count];
    pthread_create(&tfd[i], NULL, border_detection_filter_thread, &data[i]);*/
}

void border_detection_filter_thread(const unsigned char** r_matrix, unsigned char** g_matrix, unsigned char** b_matrix){

}