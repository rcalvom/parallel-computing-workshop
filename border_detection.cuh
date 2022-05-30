#ifndef BORDER_DETECTION_CUDA
#define BORDER_DETECTION_CUDA

__global__ void grayscale_kernel(unsigned char* input_image_device, unsigned char* grayscale_image_device, size_t image_size, int block_count, int thread_count);
__global__ void border_detection_kernel(unsigned char* grayscale_image_device, unsigned char* output_image_device, int width, int height, double filter_intensity, size_t image_size, int block_count, int thread_count);


#endif