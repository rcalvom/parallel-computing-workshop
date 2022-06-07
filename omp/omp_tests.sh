#!/bin/bash

# Text colors 
green="\e[32m"
blue="\e[34m"
end_color="\e[0m"

# Thread counts
threads=(1 2 4 8 16)

# Thread counts
sizes=(3)

# Script start
echo -e "Execute omp test script"
echo -e

# Compile omp matrix multiplication program
echo -e "${blue}Compiling program...${end_color}"
make build
echo -e "${green}Done${end_color}"
echo -e

# Create the output folder if it does not exit
echo -e "${blue}Creating matrix output folder...${end_color}"
mkdir -p output_matrices
echo -e "${green}Done${end_color}"
echo -e

# Create folder with the outputs of executions
echo -e "${blue}Creating execution output folder...${end_color}"
mkdir -p out
echo -e "${green}Done${end_color}"
echo -e

# Execute all test cases and save their results in the output folder
for size in "${sizes[@]}"
do
    for thread in "${threads[@]}"
    do
        echo -e "${blue}Matrix size: $size, Threads: $thread ${end_color}"
        echo -e "${blue}Executing test...${end_color}"
        OUTPUT=`./matrix_multiplication input_matrices/a_${size}_matrix.txt input_matrices/b_${size}_matrix.txt  output_matrices/c_${size}_matrix.txt ${size} ${thread}`
        echo -e ${OUTPUT}
        echo -e ${OUTPUT} >> out/"omp_size_${size}_threads_${thread}.out"
        echo -e "${green}Done${end_color}"
        echo -e
    done
done

# Execute Python script that generate plots
echo -e "${blue}Creating plots...${end_color}"
python3 plots/plot.py
echo -e "${green}Done${end_color}"
echo -e