#!/bin/bash

# Text colors 
green="\e[32m"
blue="\e[34m"
end_color="\e[0m"

# Image sizes
sizes=("4k" "1080p" "720p")

# Thread counts
threads=(1 2 4 8 16)

# filter intensity
filter_intensity=1.0

# Script
echo -e "Execute test script"
echo

echo -e "${blue}Compiling program...${end_color}"
make build
echo -e "${green}Done${end_color}"
echo

for size in "${sizes[@]}"
do
    for thread in "${threads[@]}"
    do
        echo -e "${blue}Size: $size, Threads: $thread ${end_color}"
        echo -e "${blue}Executing test...${end_color}"
        ./border_detection input_images/$size.jpg output_images/$size.jpg 1 $filter_intensity
        echo -e "${green}Done${end_color}"
        echo
    done
done


