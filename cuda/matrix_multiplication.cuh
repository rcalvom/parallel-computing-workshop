#ifndef MATRIX_MULTIPLICATION_CUDA
#define MATRIX_MULTIPLICATION_CUDA

__global__ void multiply_matrices_kernel(int* matrix_a, int* matrix_b, int* matrix_c, int matrix_size, int block_count, int thread_count);


#endif