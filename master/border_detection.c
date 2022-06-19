/**
 * @file border_detection.c
 * @author Ricardo Andrés Calvo Méndez (rcalvom@unal.edu.co)
 * @author Jorge Aurelio Morales Manrique (jomorales@unal.edu.co)
 * @brief Process a picture with a border detection filter.
 * @version 1.0
 * @date 2022-06-19
 * 
 * @copyright Copyright (c) 2022
 * 
 */

// Standard input/output library
#include <stdio.h>

// Open mp library
#include <omp.h>

// Stb image library
#define STB_IMAGE_IMPLEMENTATION
#include "stb_image/stb_image.h"
#define STB_IMAGE_WRITE_IMPLEMENTATION
#include "stb_image/stb_image_write.h"

// Border detection library
#include "border_detection.h"


/**
 * @brief Apply the border detection filter to a given input file and write it in a given output file
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
     * @brief Allocate memory for generated images
     * 
     */
    size_t image_size = width * height;
    unsigned char* grayscale_image = malloc(image_size);
    unsigned char* output_image = malloc(image_size);
    if(grayscale_image == NULL || output_image == NULL){
        perror("The memory couldn't be allocated. Aborting");
        exit(EXIT_FAILURE);
    }
    /**
     * @brief Define variables to threads
     * 
     */
    struct border_detection_thread_input *data = malloc(threads_count * sizeof(struct border_detection_thread_input));
    if(data == NULL){
        perror("The memory couldn't be allocated. Aborting");
        exit(EXIT_FAILURE);
    }
    for(int i = 0; i < threads_count; i++){
        (data + i)->start = image_size / threads_count * i;
        (data + i)->end = image_size / threads_count * (i + 1);
    }
    /**
     * @brief Create and execute the threads to grayscale the image
     * 
     */
    #pragma omp parallel num_threads(threads_count) 
    {
        int id = omp_get_thread_num();
        for(int i = (data + id)->start; i < (data + id)->end; i++){
            *(grayscale_image + i) = rbg_to_grayscale(*(input_image + 3 * i), *(input_image + 3 * i + 1), *(input_image + 3 * i + 2));
        }
    }
    /**
     * @brief Create and execute the threads to apply border filter to the image
     * 
     */
    #pragma omp parallel num_threads(threads_count) 
    {
        int id = omp_get_thread_num();
        for(int i = (data + id)->start; i < (data + id)->end; i++){
            int p11 = (i % width == 0 || i < width) ? 0 : *(grayscale_image + i - width - 1);
            int p12 = (i < width) ? 0 : *(grayscale_image + i - width);
            int p13 = (i % width == width - 1 || i < width) ? 0 : *(grayscale_image + i - width + 1);
            int p21 = (i % width == 0) ? 0 : *(grayscale_image + i - 1);
            int p22 = *(grayscale_image + i);
            int p23 = (i % width == width - 1) ? 0 : *(grayscale_image + i + 1);
            int p31 = (i % width == 0 || i + width >= width * height) ? 0 : *(grayscale_image + i + width - 1);
            int p32 = (i + width >= width * height) ? 0 : *(grayscale_image + i + width);
            int p33 = (i % width == width - 1 || i + width >= width * height) ? 0 : *(grayscale_image + i + width + 1);
            int result = (-filter_intensity * p11) + (-filter_intensity * p12) + (-filter_intensity * p13) + (-filter_intensity * p21) + (8 * filter_intensity * p22) + (-filter_intensity * p23) + (-filter_intensity * p31) + (-filter_intensity * p32) + (-filter_intensity * p33);
            if(result < 0){
                *(output_image + i) = 0;
            }else if(result > 255){
                *(output_image + i) = 255;
            }else{
                *(output_image + i) = result;
            }
        }
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
    free(data);
    free(grayscale_image);
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