#!/bin/bash

# Text colors 
green="\e[32m"
blue="\e[34m"
end_color="\e[0m"

# filter intensity
filter_intensity=1.0

# Script start
echo -e "Execute test script"
echo -e

# Compile border detection program
echo -e "${blue}Compiling program...${end_color}"
make build
echo -e "${green}Done${end_color}"
echo -e

# Create the output images folder if it does not exit
echo -e "${blue}Creating output_images folder...${end_color}"
mkdir -p output_images 
echo -e "${green}Done${end_color}"
echo -e

# Create folder with the outputs of executions
echo -e "${blue}Creating output execution folder...${end_color}"
mkdir -p report/out
echo -e "${green}Done${end_color}"
echo -e

# Create folder for plot generation
echo -e "${blue}Creating plots folder...${end_color}"
mkdir -p report/plots
echo -e "${green}Done${end_color}"
echo -e

# Execute all test cases and save their results in the output folder
echo -e "${blue}Size: 4k, Threads: 1 ${end_color}"
echo -e "${blue}Executing test...${end_color}"
OUTPUT=`./border_detection input_images/4k.jpg output_images/4k.jpg $filter_intensity 1`
echo -e ${OUTPUT}
echo -e ${OUTPUT} >> report/out/"border_detection_4k_1.out"
echo -e "${green}Done${end_color}"
echo -e

echo -e "${blue}Size: 4k, Threads: 2 ${end_color}"
echo -e "${blue}Executing test...${end_color}"
OUTPUT=`./border_detection input_images/4k.jpg output_images/4k.jpg $filter_intensity 2`
echo -e ${OUTPUT}
echo -e ${OUTPUT} >> report/out/"border_detection_4k_2.out"
echo -e "${green}Done${end_color}"
echo -e

echo -e "${blue}Size: 4k, Threads: 4 ${end_color}"
echo -e "${blue}Executing test...${end_color}"
OUTPUT=`./border_detection input_images/4k.jpg output_images/4k.jpg $filter_intensity 4`
echo -e ${OUTPUT}
echo -e ${OUTPUT} >> report/out/"border_detection_4k_4.out"
echo -e "${green}Done${end_color}"
echo -e

echo -e "${blue}Size: 4k, Threads: 8 ${end_color}"
echo -e "${blue}Executing test...${end_color}"
OUTPUT=`./border_detection input_images/4k.jpg output_images/4k.jpg $filter_intensity 8`
echo -e ${OUTPUT}
echo -e ${OUTPUT} >> report/out/"border_detection_4k_8.out"
echo -e "${green}Done${end_color}"
echo -e

echo -e "${blue}Size: 4k, Threads: 16 ${end_color}"
echo -e "${blue}Executing test...${end_color}"
OUTPUT=`./border_detection input_images/4k.jpg output_images/4k.jpg $filter_intensity 16`
echo -e ${OUTPUT}
echo -e ${OUTPUT} >> report/out/"border_detection_4k_16.out"
echo -e "${green}Done${end_color}"
echo -e

echo -e "${blue}Size: 1080p, Threads: 1 ${end_color}"
echo -e "${blue}Executing test...${end_color}"
OUTPUT=`./border_detection input_images/1080p.jpg output_images/1080p.jpg $filter_intensity 1`
echo -e ${OUTPUT}
echo -e ${OUTPUT} >> report/out/"border_detection_1080p_1.out"
echo -e "${green}Done${end_color}"
echo -e

echo -e "${blue}Size: 1080p, Threads: 2 ${end_color}"
echo -e "${blue}Executing test...${end_color}"
OUTPUT=`./border_detection input_images/1080p.jpg output_images/1080p.jpg $filter_intensity 2`
echo -e ${OUTPUT}
echo -e ${OUTPUT} >> report/out/"border_detection_1080p_2.out"
echo -e "${green}Done${end_color}"
echo -e

echo -e "${blue}Size: 1080p, Threads: 4 ${end_color}"
echo -e "${blue}Executing test...${end_color}"
OUTPUT=`./border_detection input_images/1080p.jpg output_images/1080p.jpg $filter_intensity 4`
echo -e ${OUTPUT}
echo -e ${OUTPUT} >> report/out/"border_detection_1080p_4.out"
echo -e "${green}Done${end_color}"
echo -e

echo -e "${blue}Size: 1080p, Threads: 8 ${end_color}"
echo -e "${blue}Executing test...${end_color}"
OUTPUT=`./border_detection input_images/1080p.jpg output_images/1080p.jpg $filter_intensity 8`
echo -e ${OUTPUT}
echo -e ${OUTPUT} >> report/out/"border_detection_1080p_8.out"
echo -e "${green}Done${end_color}"
echo -e

echo -e "${blue}Size: 1080p, Threads: 16 ${end_color}"
echo -e "${blue}Executing test...${end_color}"
OUTPUT=`./border_detection input_images/1080p.jpg output_images/1080p.jpg $filter_intensity 16`
echo -e ${OUTPUT}
echo -e ${OUTPUT} >> report/out/"border_detection_1080p_16.out"
echo -e "${green}Done${end_color}"
echo -e

echo -e "${blue}Size: 720p, Threads: 1 ${end_color}"
echo -e "${blue}Executing test...${end_color}"
OUTPUT=`./border_detection input_images/720p.jpg output_images/720p.jpg $filter_intensity 1`
echo -e ${OUTPUT}
echo -e ${OUTPUT} >> report/out/"border_detection_720p_1.out"
echo -e "${green}Done${end_color}"
echo -e

echo -e "${blue}Size: 720p, Threads: 2 ${end_color}"
echo -e "${blue}Executing test...${end_color}"
OUTPUT=`./border_detection input_images/720p.jpg output_images/720p.jpg $filter_intensity 2`
echo -e ${OUTPUT}
echo -e ${OUTPUT} >> report/out/"border_detection_720p_2.out"
echo -e "${green}Done${end_color}"
echo -e

echo -e "${blue}Size: 720p, Threads: 4 ${end_color}"
echo -e "${blue}Executing test...${end_color}"
OUTPUT=`./border_detection input_images/720p.jpg output_images/720p.jpg $filter_intensity 4`
echo -e ${OUTPUT}
echo -e ${OUTPUT} >> report/out/"border_detection_720p_4.out"
echo -e "${green}Done${end_color}"
echo -e

echo -e "${blue}Size: 720p, Threads: 8 ${end_color}"
echo -e "${blue}Executing test...${end_color}"
OUTPUT=`./border_detection input_images/720p.jpg output_images/720p.jpg $filter_intensity 8`
echo -e ${OUTPUT}
echo -e ${OUTPUT} >> report/out/"border_detection_720p_8.out"
echo -e "${green}Done${end_color}"
echo -e

echo -e "${blue}Size: 720p, Threads: 16 ${end_color}"
echo -e "${blue}Executing test...${end_color}"
OUTPUT=`./border_detection input_images/720p.jpg output_images/720p.jpg $filter_intensity 16`
echo -e ${OUTPUT}
echo -e ${OUTPUT} >> report/out/"border_detection_720p_16.out"
echo -e "${green}Done${end_color}"
echo -e

# Execute Python script that generate plots and compile the LaTeX report
echo -e "${blue}Creating plots and compilig report...${end_color}"
python3 report/report.py
echo -e "${green}Done${end_color}"
echo -e