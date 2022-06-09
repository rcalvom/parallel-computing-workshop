#!/bin/bash

# Text colors 
green="\e[32m"
blue="\e[34m"
end_color="\e[0m"

# Current folder
parent_directory=$(pwd)

# Execute OMP Tests
echo -e "${blue}Executing OMP Tests...${end_color}"
cd "${parent_directory}"
cd omp
./omp_tests.sh
echo -e

# Execute CUDA Tests
echo -e "${blue}Executing CUDA Tests...${end_color}"
cd "${parent_directory}"
cd cuda
./cuda_tests.sh
echo -e