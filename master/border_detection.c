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

// Open mpi library
#include <mpi.h>

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
 * @param grayscale_filename Grayscale file path
 * @param output_filename Output file path
 * @param filter_intensity Border detection filter intensity
 * @param process_count Numer of processes to process the image
 */
void border_detection_filter(char* input_filename, char* grayscale_filename, char* output_filename, double filter_intensity, int process_count){
    /**
     * @brief Get rank of current process
     * 
     */
    int id;
    MPI_Comm_rank(MPI_COMM_WORLD, &id);

    /**
     * @brief Load the image from file to memory (master node)
     * 
     */

    int width, height, channels;
    unsigned char* input_image;
    input_image = stbi_load(input_filename, &width, &height, &channels, 3);
    if(input_image == NULL){
        exit(EXIT_FAILURE);
    }
    
    /**
     * @brief Allocate memory for grayscale generated image
     * 
     */

    unsigned char* grayscale_image = malloc(width * height);
    if(grayscale_image == NULL){
        perror("The memory couldn't be allocated. Aborting");
        exit(EXIT_FAILURE);
    }
    
    /**
     * @brief Allocate memory for final generated image
     * 
     */

    unsigned char* output_image;
    if(id == 0){
        output_image = malloc(width * height);
        if(output_image == NULL){
            perror("The memory couldn't be allocated. Aborting");
            exit(EXIT_FAILURE);
        }
    }

    /**
     * @brief Allocate memory for images on each process
     * 
     */

    int start = (width * height) / process_count * id;
    int end = (width * height) / process_count * (id + 1);
    size_t image_size_process = end - start;
    unsigned char* grayscale_image_process = malloc(image_size_process);
    unsigned char* output_image_process = malloc(image_size_process);
    if(grayscale_image_process == NULL || output_image_process == NULL){
        perror("The memory couldn't be allocated. Aborting");
        exit(EXIT_FAILURE);
    }


    /**
     * @brief Scatter the image to another nodes
     * 
     */ 
    double s_t1, e_t1;

    /**
     * @brief Create and execute the processes to grayscale the image
     * 
     */
    for(int i = 0; i < image_size_process; i++){
        *(grayscale_image_process + i) = rbg_to_grayscale(*(input_image + 3 * (start + i)), *(input_image + 3 * (start + i) + 1), *(input_image + 3 * (start + i) + 2));
    }
    MPI_Barrier(MPI_COMM_WORLD);

     /**
     * @brief Gather grayscale image and broadcast it to all nodes 
     * 
     */ 
    MPI_Barrier(MPI_COMM_WORLD);
    s_t1 = MPI_Wtime();
    MPI_Gather(grayscale_image_process, image_size_process, MPI_UNSIGNED_CHAR, grayscale_image, image_size_process, MPI_UNSIGNED_CHAR, 0, MPI_COMM_WORLD);
    MPI_Barrier(MPI_COMM_WORLD);
    e_t1 = MPI_Wtime();
    if (id == 0) {
        printf("MPI_Gather: %f\n", e_t1 - s_t1);
    }
    if(id == 0){
        int status = stbi_write_jpg(grayscale_filename, width, height, 1, grayscale_image, 100);
        if(status == 0){
            perror("The output image couldn't be saved. Aborting");
            exit(EXIT_FAILURE);
        }
    }

    free(grayscale_image);
    MPI_Barrier(MPI_COMM_WORLD);
    grayscale_image = stbi_load(grayscale_filename, &width, &height, &channels, 1);
    if(grayscale_image == NULL){
        perror("The output image couldn't be loaded. Aborting");
        exit(EXIT_FAILURE);
    }

    /**
     * @brief Create and execute the processes to apply border filter to the image
     * 
     */
    for(int i = start; i < end; i++){
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
            *(output_image_process + i - start) = 0;
        }else if(result > 255){
            *(output_image_process + i - start) = 255;
        }else{
            *(output_image_process + i - start) = result;
        }
    }

    /**
     * @brief Gather the image to master nodes
     * 
     */
    MPI_Barrier(MPI_COMM_WORLD);
    s_t1 = MPI_Wtime();
    MPI_Gather(output_image_process, image_size_process, MPI_UNSIGNED_CHAR, output_image, image_size_process, MPI_UNSIGNED_CHAR, 0, MPI_COMM_WORLD);
    MPI_Barrier(MPI_COMM_WORLD);
    e_t1 = MPI_Wtime();
    if (id == 0) {
        printf("MPI_Gather: %f\n", e_t1 - s_t1);
    }

    /**
     * @brief Save the generated image to a file
     * 
     */
    MPI_Barrier(MPI_COMM_WORLD);
    if(id == 0){
        int status = stbi_write_jpg(output_filename, width, height, 1, output_image, 100);
        if(status == 0){
            perror("The output image couldn't be saved. Aborting");
            exit(EXIT_FAILURE);
        }
    }
    
    /**
     * @brief Free the memory used in the generation process
     * 
     */
    if(id == 0){
        stbi_image_free(input_image);
        free(grayscale_image);
        free(output_image);
    }
    free(grayscale_image_process);
    free(output_image_process);
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