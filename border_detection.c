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

// Stb image library
#define STB_IMAGE_IMPLEMENTATION
#include "stb_image/stb_image.h"
#define STB_IMAGE_WRITE_IMPLEMENTATION
#include "stb_image/stb_image_write.h"

// Border detection library
#include "border_detection.h"


/**
 * @brief Apply the border detection filter to a given input file and write it in a giver output file
 * 
 * @param input_filename Input file path
 * @param output_filename Output file path
 * @param filter_intensity Border detection filter intensity
 * @param threads_count Numer of threads to process the image
 */
void border_detection_filter(char* input_filename, char* output_filename, double filter_intensity, int threads_count){
    /**
     * @brief Load the image form file to memory
     * 
     */
    int width, height, channels;
    unsigned char* input_image = stbi_load(input_filename, &width, &height, &channels, 3);
    if(input_image == NULL){
        perror("The image couldn't be readed. Aborting");
        exit(EXIT_FAILURE);
    }
    /**
     * @brief Allocate memory for generated image
     * 
     */
    size_t image_size = width * height;
    unsigned char* output_image = malloc(image_size);
    if(output_image == NULL){
        perror("The memory couldn't be allocated. Aborting");
        exit(EXIT_FAILURE);
    }
    /**
     * @brief Create and execute the threads to generate the image
     * 
     */
    pthread_t tfd[threads_count];
    struct border_detection_thread_input data[threads_count];
    for(int i = 0; i < threads_count; i++){
        data[i].input_image = input_image;
        data[i].output_image = output_image;
        data[i].start = image_size / threads_count * i;
        data[i].end = image_size / threads_count * (i + 1);
        pthread_create(&tfd[i], NULL, border_detection_filter_thread, &data[i]);
    }
    for(int i = 0; i < threads_count; i++){
        pthread_join(tfd[i], NULL);
    }

    /**
     * @brief Save the generated image to a file
     * 
     */
    int status = stbi_write_jpg(output_filename, width, height, 1, output_image, 100);
    if(status == 0){
        perror("The output image couldn't be saved. Aborting");
        exit(EXIT_FAILURE);
    }
    /**
     * @brief Free the memory used in the generation process
     * 
     */
    stbi_image_free(input_image);
    free(output_image);
}

/**
 * @brief Transform a RGB Pixel to the corresponging grayscale
 * 
 * @param r Red Value
 * @param g Green Value
 * @param b Blue Value
 * @return Grayscale 
 */
unsigned char rbg_to_grayscale(unsigned char r, unsigned char g, unsigned char b){
    return 0.299 * r + 0.587 * g + 0.114 * b;
}

/**
 * @brief Thread Function. Calculate a part of the filter
 * 
 * @param data Thread input pointer
 */
void *border_detection_filter_thread(void* data){
    struct border_detection_thread_input input = *((struct border_detection_thread_input *)data);
    for(int i = input.start; i < input.end; i++){
        *(input.output_image + i) = rbg_to_grayscale(*(input.input_image + 3 * i), *(input.input_image + 3 * i + 1), *(input.input_image + 3 * i + 2));
    }
}