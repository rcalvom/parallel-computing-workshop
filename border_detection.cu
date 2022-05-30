/**
 * @file border_detection.c
 * @author Ricardo Andrés Calvo Méndez (rcalvom@unal.edu.co)
 * @author Jorge Aurelio Morales Manrique (jomorales@unal.edu.co)
 * @brief Process a picture with a border detection filter.
 * @version 1.0
 * @date 2022-05-07
 * 
 * @copyright Copyright (c) 2022
 * 
 */

// Standard input/output library
#include <stdio.h>

// Cuda Library
#include <cuda.h>

// Stb image library
#define STB_IMAGE_IMPLEMENTATION
#include "stb_image/stb_image.h"
#define STB_IMAGE_WRITE_IMPLEMENTATION
#include "stb_image/stb_image_write.h"

// Border detection library
extern "C" {
    #include "border_detection.h"
}


/**
 * @brief Grayscale Kernel. Converts a Image to a Grayscale Image using the GPU
 * 
 * @param input_image_device direction to input image on device
 * @param grayscale_image_device direction to grayscale image on device
 * @param image_size size of the grayscale image
 * @param threads_count number of threads executed
 */
__global__ void grayscale_kernel(unsigned char* input_image_device, unsigned char* grayscale_image_device, size_t image_size, int threads_count) {
    int index = (blockDim.x * blockIdx.x) + threadIdx.x; 
    int start = image_size / threads_count * index;
    int end = image_size / threads_count * (index + 1);

    for(int i = start; i < end; i++){
        *(grayscale_image_device + i) = 0.299 * *(input_image_device + 3 * i) + 0.587 * *(input_image_device + 3 * i + 1) + 0.114 * *(input_image_device + 3 * i + 2);
    }

}

/**
 * @brief Border detection Kernel. Converts a Grayscale Image to a Border detection Image using the GPU
 * 
 * @param grayscale_image_device direction to grayscale image on device
 * @param output_image_device direction to output image on device
 * @param image_size size of the grayscale image
 * @param threads_count number of threads executed
 */
__global__ void border_detection_kernel(unsigned char* grayscale_image_device, unsigned char* output_image_device, int width, int height, double filter_intensity, size_t image_size, int threads_count) {
    int index = (blockDim.x * blockIdx.x) + threadIdx.x; 
    int start = image_size / threads_count * index;
    int end = image_size / threads_count * (index + 1);

    for(int i = start; i < end; i++){
        int p11 = (i % width == 0 || i < width) ? 0 : *(grayscale_image_device + i - width - 1);
        int p12 = (i < width) ? 0 : *(grayscale_image_device + i - width);
        int p13 = (i % width == width - 1 || i < width) ? 0 : *(grayscale_image_device + i - width + 1);
        int p21 = (i % width == 0) ? 0 : *(grayscale_image_device + i - 1);
        int p22 = *(grayscale_image_device + i);
        int p23 = (i % width == width - 1) ? 0 : *(grayscale_image_device + i + 1);
        int p31 = (i % width == 0 || i + width >= width * height) ? 0 : *(grayscale_image_device + i + width - 1);
        int p32 = (i + width >= width * height) ? 0 : *(grayscale_image_device + i + width);
        int p33 = (i % width == width - 1 || i + width >= width * height) ? 0 : *(grayscale_image_device + i + width + 1);
        int result = (-filter_intensity * p11) + (-filter_intensity * p12) + (-filter_intensity * p13) + (-filter_intensity * p21) + (8 * filter_intensity * p22) + (-filter_intensity * p23) + (-filter_intensity * p31) + (-filter_intensity * p32) + (-filter_intensity * p33);
        if(result < 0){
            *(output_image_device + i) = 0;
        }else if(result > 255){
            *(output_image_device + i) = 255;
        }else{
            *(output_image_device + i) = result;
        }
    }
}

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
     * @brief Allocate host memory for generated images
     * 
     */
    size_t image_size = width * height;
    unsigned char* output_image = (unsigned char*) malloc(image_size);
    if(output_image == NULL){
        perror("The memory couldn't be allocated. Aborting");
        exit(EXIT_FAILURE);
    }

    /**
     * @brief Allocate device memory for the input image and generated images
     * 
     */
    unsigned char* input_image_device;
    unsigned char* grayscale_image_device;
    unsigned char* output_image_device;
    if(cudaMalloc((void **) &input_image_device, image_size * 3) != cudaSuccess){
        perror("The device memory couldn't be allocated. Aborting");
        exit(EXIT_FAILURE);
    }
    if(cudaMalloc((void **) &grayscale_image_device, image_size) != cudaSuccess){
        perror("The device memory couldn't be allocated. Aborting");
        exit(EXIT_FAILURE);
    }
    if(cudaMalloc((void **) &output_image_device, image_size) != cudaSuccess){
        perror("The device memory couldn't be allocated. Aborting");
        exit(EXIT_FAILURE);
    }

    /**
     * @brief Copy image from host to device
     * 
     */
    cudaMemcpy(input_image_device, input_image, image_size * 3, cudaMemcpyHostToDevice);

    /**
     * @brief Execute grayscale kernel and check for errors
     * 
     */
    grayscale_kernel<<<1, threads_count>>>(input_image_device, grayscale_image_device, image_size, threads_count);
    if (cudaGetLastError() != cudaSuccess){
        perror("Has been ocurr an error in kernel execution. Aborting");
        exit(EXIT_FAILURE);
    }

    /**
     * @brief Execute border detection kernel and check for errors
     * 
     */
    border_detection_kernel<<<1, threads_count>>>(grayscale_image_device, output_image_device, width, height, filter_intensity, image_size, threads_count);
    if (cudaGetLastError() != cudaSuccess){
        perror("Has been ocurr an error in kernel execution. Aborting");
        exit(EXIT_FAILURE);
    }

    /**
     * @brief Copy generated image from device to host
     * 
     */
    cudaMemcpy(output_image, output_image_device, image_size, cudaMemcpyDeviceToHost);

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
    cudaFree(input_image_device);
    cudaFree(grayscale_image_device);
    cudaFree(output_image_device);
}
