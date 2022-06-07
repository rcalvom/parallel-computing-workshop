#ifndef MATRIX_MULTIPLICATION
#define MATRIX_MULTIPLICATION

void matrix_multiplication(char* matrix_a_filename, char* matrix_b_filename, char* matrix_c_filename, int matrix_size, int block_count, int thread_count);
void generate_matrix(char* matrix_filename, int matrix_size);
int* read_matrix(char* matrix_filename, int matrix_size);
int* multiply_matrices(int* matrix_a, int* matrix_b, int matrix_size, int thread_count);
void save_matrix(int* matrix, char* matrix_filename, int matrix_size);

#endif