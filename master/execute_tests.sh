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
echo -e "${blue}Size: 4k, Processes: 1 ${end_color}"
echo -e "${blue}Executing test...${end_color}"
mpirun -np 1 --hostfile mpi-hosts ./border_detection input_images/4k.jpg output_images/4k.jpg $filter_intensity 1
#echo -e ${OUTPUT} >> report/out/"border_detection_4k_1.out"
echo -e "${green}Done${end_color}"
echo -e

echo -e "${blue}Size: 4k, Processes: 2 ${end_color}"
echo -e "${blue}Executing test...${end_color}"
mpirun -np 2 --hostfile mpi-hosts ./border_detection input_images/4k.jpg output_images/4k.jpg $filter_intensity 2
#echo -e ${OUTPUT} >> report/out/"border_detection_4k_2.out"
echo -e "${green}Done${end_color}"
echo -e

echo -e "${blue}Size: 4k, Processes: 3 ${end_color}"
echo -e "${blue}Executing test...${end_color}"
mpirun -np 3 --hostfile mpi-hosts ./border_detection input_images/4k.jpg output_images/4k.jpg $filter_intensity 3
#echo -e ${OUTPUT} >> report/out/"border_detection_4k_3.out"
echo -e "${green}Done${end_color}"
echo -e

echo -e "${blue}Size: 4k, Processes: 4 ${end_color}"
echo -e "${blue}Executing test...${end_color}"
mpirun -np 4 --hostfile mpi-hosts ./border_detection input_images/4k.jpg output_images/4k.jpg $filter_intensity 4
#echo -e ${OUTPUT} >> report/out/"border_detection_4k_4.out"
echo -e "${green}Done${end_color}"
echo -e

echo -e "${blue}Size: 4k, Processes: 5 ${end_color}"
echo -e "${blue}Executing test...${end_color}"
mpirun -np 5 --hostfile mpi-hosts ./border_detection input_images/4k.jpg output_images/4k.jpg $filter_intensity 5
#echo -e ${OUTPUT} >> report/out/"border_detection_4k_5.out"
echo -e "${green}Done${end_color}"
echo -e

echo -e "${blue}Size: 4k, Processes: 6 ${end_color}"
echo -e "${blue}Executing test...${end_color}"
mpirun -np 6 --hostfile mpi-hosts ./border_detection input_images/4k.jpg output_images/4k.jpg $filter_intensity 6
#echo -e ${OUTPUT} >> report/out/"border_detection_4k_6.out"
echo -e "${green}Done${end_color}"
echo -e

echo -e "${blue}Size: 4k, Processes: 7 ${end_color}"
echo -e "${blue}Executing test...${end_color}"
mpirun -np 7 --hostfile mpi-hosts ./border_detection input_images/4k.jpg output_images/4k.jpg $filter_intensity 7
#echo -e ${OUTPUT} >> report/out/"border_detection_4k_7.out"
echo -e "${green}Done${end_color}"
echo -e

echo -e "${blue}Size: 4k, Processes: 8 ${end_color}"
echo -e "${blue}Executing test...${end_color}"
mpirun -np 8 --hostfile mpi-hosts ./border_detection input_images/4k.jpg output_images/4k.jpg $filter_intensity 8
#echo -e ${OUTPUT} >> report/out/"border_detection_4k_8.out"
echo -e "${green}Done${end_color}"
echo -e

echo -e "${blue}Size: 4k, Processes: 9 ${end_color}"
echo -e "${blue}Executing test...${end_color}"
mpirun -np 9 --hostfile mpi-hosts ./border_detection input_images/4k.jpg output_images/4k.jpg $filter_intensity 9
#echo -e ${OUTPUT} >> report/out/"border_detection_4k_9.out"
echo -e "${green}Done${end_color}"
echo -e

echo -e "${blue}Size: 4k, Processes: 10 ${end_color}"
echo -e "${blue}Executing test...${end_color}"
mpirun -np 10 --hostfile mpi-hosts ./border_detection input_images/4k.jpg output_images/4k.jpg $filter_intensity 10
#echo -e ${OUTPUT} >> report/out/"border_detection_4k_10.out"
echo -e "${green}Done${end_color}"
echo -e

echo -e "${blue}Size: 4k, Processes: 11 ${end_color}"
echo -e "${blue}Executing test...${end_color}"
mpirun -np 11 --hostfile mpi-hosts ./border_detection input_images/4k.jpg output_images/4k.jpg $filter_intensity 11
#echo -e ${OUTPUT} >> report/out/"border_detection_4k_11.out"
echo -e "${green}Done${end_color}"
echo -e

echo -e "${blue}Size: 4k, Processes: 12 ${end_color}"
echo -e "${blue}Executing test...${end_color}"
mpirun -np 12 --hostfile mpi-hosts ./border_detection input_images/4k.jpg output_images/4k.jpg $filter_intensity 12
#echo -e ${OUTPUT} >> report/out/"border_detection_4k_12.out"
echo -e "${green}Done${end_color}"
echo -e

echo -e "${blue}Size: 4k, Processes: 13 ${end_color}"
echo -e "${blue}Executing test...${end_color}"
mpirun -np 13 --hostfile mpi-hosts ./border_detection input_images/4k.jpg output_images/4k.jpg $filter_intensity 13
#echo -e ${OUTPUT} >> report/out/"border_detection_4k_13.out"
echo -e "${green}Done${end_color}"
echo -e

echo -e "${blue}Size: 4k, Processes: 14 ${end_color}"
echo -e "${blue}Executing test...${end_color}"
mpirun -np 14 --hostfile mpi-hosts ./border_detection input_images/4k.jpg output_images/4k.jpg $filter_intensity 14
#echo -e ${OUTPUT} >> report/out/"border_detection_4k_14.out"
echo -e "${green}Done${end_color}"
echo -e

echo -e "${blue}Size: 4k, Processes: 15 ${end_color}"
echo -e "${blue}Executing test...${end_color}"
mpirun -np 15 --hostfile mpi-hosts ./border_detection input_images/4k.jpg output_images/4k.jpg $filter_intensity 15
#echo -e ${OUTPUT} >> report/out/"border_detection_4k_15.out"
echo -e "${green}Done${end_color}"
echo -e

echo -e "${blue}Size: 4k, Processes: 16 ${end_color}"
echo -e "${blue}Executing test...${end_color}"
mpirun -np 16 --hostfile mpi-hosts ./border_detection input_images/4k.jpg output_images/4k.jpg $filter_intensity 16
#echo -e ${OUTPUT} >> report/out/"border_detection_4k_16.out"
echo -e "${green}Done${end_color}"
echo -e



echo -e "${blue}Size: 1080p, Processes: 1 ${end_color}"
echo -e "${blue}Executing test...${end_color}"
mpirun -np 1 --hostfile mpi-hosts ./border_detection input_images/1080p.jpg output_images/1080p.jpg $filter_intensity 1
#echo -e ${OUTPUT} >> report/out/"border_detection_1080p_1.out"
echo -e "${green}Done${end_color}"
echo -e

echo -e "${blue}Size: 1080p, Processes: 2 ${end_color}"
echo -e "${blue}Executing test...${end_color}"
mpirun -np 2 --hostfile mpi-hosts ./border_detection input_images/1080p.jpg output_images/1080p.jpg $filter_intensity 2
#echo -e ${OUTPUT} >> report/out/"border_detection_1080p_2.out"
echo -e "${green}Done${end_color}"
echo -e

echo -e "${blue}Size: 1080p, Processes: 3 ${end_color}"
echo -e "${blue}Executing test...${end_color}"
mpirun -np 3 --hostfile mpi-hosts ./border_detection input_images/1080p.jpg output_images/1080p.jpg $filter_intensity 3
#echo -e ${OUTPUT} >> report/out/"border_detection_1080p_3.out"
echo -e "${green}Done${end_color}"
echo -e

echo -e "${blue}Size: 1080p, Processes: 4 ${end_color}"
echo -e "${blue}Executing test...${end_color}"
mpirun -np 4 --hostfile mpi-hosts ./border_detection input_images/1080p.jpg output_images/1080p.jpg $filter_intensity 4
#echo -e ${OUTPUT} >> report/out/"border_detection_1080p_4.out"
echo -e "${green}Done${end_color}"
echo -e

echo -e "${blue}Size: 1080p, Processes: 5 ${end_color}"
echo -e "${blue}Executing test...${end_color}"
mpirun -np 5 --hostfile mpi-hosts ./border_detection input_images/1080p.jpg output_images/1080p.jpg $filter_intensity 5
#echo -e ${OUTPUT} >> report/out/"border_detection_1080p_5.out"
echo -e "${green}Done${end_color}"
echo -e

echo -e "${blue}Size: 1080p, Processes: 6 ${end_color}"
echo -e "${blue}Executing test...${end_color}"
mpirun -np 6 --hostfile mpi-hosts ./border_detection input_images/1080p.jpg output_images/1080p.jpg $filter_intensity 6
#echo -e ${OUTPUT} >> report/out/"border_detection_1080p_6.out"
echo -e "${green}Done${end_color}"
echo -e

echo -e "${blue}Size: 1080p, Processes: 7 ${end_color}"
echo -e "${blue}Executing test...${end_color}"
mpirun -np 7 --hostfile mpi-hosts ./border_detection input_images/1080p.jpg output_images/1080p.jpg $filter_intensity 7
#echo -e ${OUTPUT} >> report/out/"border_detection_1080p_7.out"
echo -e "${green}Done${end_color}"
echo -e

echo -e "${blue}Size: 1080p, Processes: 8 ${end_color}"
echo -e "${blue}Executing test...${end_color}"
mpirun -np 8 --hostfile mpi-hosts ./border_detection input_images/1080p.jpg output_images/1080p.jpg $filter_intensity 8
#echo -e ${OUTPUT} >> report/out/"border_detection_1080p_8.out"
echo -e "${green}Done${end_color}"
echo -e

echo -e "${blue}Size: 1080p, Processes: 9 ${end_color}"
echo -e "${blue}Executing test...${end_color}"
mpirun -np 9 --hostfile mpi-hosts ./border_detection input_images/1080p.jpg output_images/1080p.jpg $filter_intensity 9
#echo -e ${OUTPUT} >> report/out/"border_detection_1080p_9.out"
echo -e "${green}Done${end_color}"
echo -e

echo -e "${blue}Size: 1080p, Processes: 10 ${end_color}"
echo -e "${blue}Executing test...${end_color}"
mpirun -np 10 --hostfile mpi-hosts ./border_detection input_images/1080p.jpg output_images/1080p.jpg $filter_intensity 10
#echo -e ${OUTPUT} >> report/out/"border_detection_1080p_10.out"
echo -e "${green}Done${end_color}"
echo -e

echo -e "${blue}Size: 1080p, Processes: 11 ${end_color}"
echo -e "${blue}Executing test...${end_color}"
mpirun -np 11 --hostfile mpi-hosts ./border_detection input_images/1080p.jpg output_images/1080p.jpg $filter_intensity 11
#echo -e ${OUTPUT} >> report/out/"border_detection_1080p_11.out"
echo -e "${green}Done${end_color}"
echo -e

echo -e "${blue}Size: 1080p, Processes: 12 ${end_color}"
echo -e "${blue}Executing test...${end_color}"
mpirun -np 12 --hostfile mpi-hosts ./border_detection input_images/1080p.jpg output_images/1080p.jpg $filter_intensity 12
#echo -e ${OUTPUT} >> report/out/"border_detection_1080p_12.out"
echo -e "${green}Done${end_color}"
echo -e

echo -e "${blue}Size: 1080p, Processes: 13 ${end_color}"
echo -e "${blue}Executing test...${end_color}"
mpirun -np 13 --hostfile mpi-hosts ./border_detection input_images/1080p.jpg output_images/1080p.jpg $filter_intensity 13
#echo -e ${OUTPUT} >> report/out/"border_detection_1080p_13.out"
echo -e "${green}Done${end_color}"
echo -e

echo -e "${blue}Size: 1080p, Processes: 14 ${end_color}"
echo -e "${blue}Executing test...${end_color}"
mpirun -np 14 --hostfile mpi-hosts ./border_detection input_images/1080p.jpg output_images/1080p.jpg $filter_intensity 14
#echo -e ${OUTPUT} >> report/out/"border_detection_1080p_14.out"
echo -e "${green}Done${end_color}"
echo -e

echo -e "${blue}Size: 1080p, Processes: 15 ${end_color}"
echo -e "${blue}Executing test...${end_color}"
mpirun -np 15 --hostfile mpi-hosts ./border_detection input_images/1080p.jpg output_images/1080p.jpg $filter_intensity 15
#echo -e ${OUTPUT} >> report/out/"border_detection_1080p_15.out"
echo -e "${green}Done${end_color}"
echo -e

echo -e "${blue}Size: 1080p, Processes: 16 ${end_color}"
echo -e "${blue}Executing test...${end_color}"
mpirun -np 16 --hostfile mpi-hosts ./border_detection input_images/1080p.jpg output_images/1080p.jpg $filter_intensity 16
#echo -e ${OUTPUT} >> report/out/"border_detection_1080p_16.out"
echo -e "${green}Done${end_color}"
echo -e




echo -e "${blue}Size: 720p, Processes: 1 ${end_color}"
echo -e "${blue}Executing test...${end_color}"
mpirun -np 1 --hostfile mpi-hosts ./border_detection input_images/720p.jpg output_images/720p.jpg $filter_intensity 1
#echo -e ${OUTPUT} >> report/out/"border_detection_720p_1.out"
echo -e "${green}Done${end_color}"
echo -e

echo -e "${blue}Size: 720p, Processes: 2 ${end_color}"
echo -e "${blue}Executing test...${end_color}"
mpirun -np 2 --hostfile mpi-hosts ./border_detection input_images/720p.jpg output_images/720p.jpg $filter_intensity 2
#echo -e ${OUTPUT} >> report/out/"border_detection_720p_2.out"
echo -e "${green}Done${end_color}"
echo -e

echo -e "${blue}Size: 720p, Processes: 3 ${end_color}"
echo -e "${blue}Executing test...${end_color}"
mpirun -np 3 --hostfile mpi-hosts ./border_detection input_images/720p.jpg output_images/720p.jpg $filter_intensity 3
#echo -e ${OUTPUT} >> report/out/"border_detection_720p_3.out"
echo -e "${green}Done${end_color}"
echo -e

echo -e "${blue}Size: 720p, Processes: 4 ${end_color}"
echo -e "${blue}Executing test...${end_color}"
mpirun -np 4 --hostfile mpi-hosts ./border_detection input_images/720p.jpg output_images/720p.jpg $filter_intensity 4
#echo -e ${OUTPUT} >> report/out/"border_detection_720p_4.out"
echo -e "${green}Done${end_color}"
echo -e

echo -e "${blue}Size: 720p, Processes: 5 ${end_color}"
echo -e "${blue}Executing test...${end_color}"
mpirun -np 5 --hostfile mpi-hosts ./border_detection input_images/720p.jpg output_images/720p.jpg $filter_intensity 5
#echo -e ${OUTPUT} >> report/out/"border_detection_720p_5.out"
echo -e "${green}Done${end_color}"
echo -e

echo -e "${blue}Size: 720p, Processes: 6 ${end_color}"
echo -e "${blue}Executing test...${end_color}"
mpirun -np 6 --hostfile mpi-hosts ./border_detection input_images/720p.jpg output_images/720p.jpg $filter_intensity 6
#echo -e ${OUTPUT} >> report/out/"border_detection_720p_6.out"
echo -e "${green}Done${end_color}"
echo -e

echo -e "${blue}Size: 720p, Processes: 7 ${end_color}"
echo -e "${blue}Executing test...${end_color}"
mpirun -np 7 --hostfile mpi-hosts ./border_detection input_images/720p.jpg output_images/720p.jpg $filter_intensity 7
#echo -e ${OUTPUT} >> report/out/"border_detection_720p_7.out"
echo -e "${green}Done${end_color}"
echo -e

echo -e "${blue}Size: 720p, Processes: 8 ${end_color}"
echo -e "${blue}Executing test...${end_color}"
mpirun -np 8 --hostfile mpi-hosts ./border_detection input_images/720p.jpg output_images/720p.jpg $filter_intensity 8
#echo -e ${OUTPUT} >> report/out/"border_detection_720p_8.out"
echo -e "${green}Done${end_color}"
echo -e

echo -e "${blue}Size: 720p, Processes: 9 ${end_color}"
echo -e "${blue}Executing test...${end_color}"
mpirun -np 9 --hostfile mpi-hosts ./border_detection input_images/720p.jpg output_images/720p.jpg $filter_intensity 9
#echo -e ${OUTPUT} >> report/out/"border_detection_720p_9.out"
echo -e "${green}Done${end_color}"
echo -e

echo -e "${blue}Size: 720p, Processes: 10 ${end_color}"
echo -e "${blue}Executing test...${end_color}"
mpirun -np 10 --hostfile mpi-hosts ./border_detection input_images/720p.jpg output_images/720p.jpg $filter_intensity 10
#echo -e ${OUTPUT} >> report/out/"border_detection_720p_10.out"
echo -e "${green}Done${end_color}"
echo -e

echo -e "${blue}Size: 720p, Processes: 11 ${end_color}"
echo -e "${blue}Executing test...${end_color}"
mpirun -np 11 --hostfile mpi-hosts ./border_detection input_images/720p.jpg output_images/720p.jpg $filter_intensity 11
#echo -e ${OUTPUT} >> report/out/"border_detection_720p_11.out"
echo -e "${green}Done${end_color}"
echo -e

echo -e "${blue}Size: 720p, Processes: 12 ${end_color}"
echo -e "${blue}Executing test...${end_color}"
mpirun -np 12 --hostfile mpi-hosts ./border_detection input_images/720p.jpg output_images/720p.jpg $filter_intensity 12
#echo -e ${OUTPUT} >> report/out/"border_detection_720p_12.out"
echo -e "${green}Done${end_color}"
echo -e

echo -e "${blue}Size: 720p, Processes: 13 ${end_color}"
echo -e "${blue}Executing test...${end_color}"
mpirun -np 13 --hostfile mpi-hosts ./border_detection input_images/720p.jpg output_images/720p.jpg $filter_intensity 13
#echo -e ${OUTPUT} >> report/out/"border_detection_720p_13.out"
echo -e "${green}Done${end_color}"
echo -e

echo -e "${blue}Size: 720p, Processes: 14 ${end_color}"
echo -e "${blue}Executing test...${end_color}"
mpirun -np 14 --hostfile mpi-hosts ./border_detection input_images/720p.jpg output_images/720p.jpg $filter_intensity 14
#echo -e ${OUTPUT} >> report/out/"border_detection_720p_14.out"
echo -e "${green}Done${end_color}"
echo -e

echo -e "${blue}Size: 720p, Processes: 15 ${end_color}"
echo -e "${blue}Executing test...${end_color}"
mpirun -np 15 --hostfile mpi-hosts ./border_detection input_images/720p.jpg output_images/720p.jpg $filter_intensity 15
#echo -e ${OUTPUT} >> report/out/"border_detection_720p_15.out"
echo -e "${green}Done${end_color}"
echo -e

echo -e "${blue}Size: 720p, Processes: 16 ${end_color}"
echo -e "${blue}Executing test...${end_color}"
mpirun -np 16 --hostfile mpi-hosts ./border_detection input_images/720p.jpg output_images/720p.jpg $filter_intensity 16
#echo -e ${OUTPUT} >> report/out/"border_detection_720p_16.out"
echo -e "${green}Done${end_color}"
echo -e


# Execute Python script that generate plots
echo -e "${blue}Creating plots...${end_color}"
python3 report/report.py
echo -e "${green}Done${end_color}"
echo -e


# Compile LaTeX project
echo -e "${blue}Compiling pdf report...${end_color}"
: $(cd report/template && pdflatex --jobname=report main.tex)+
echo -e "${green}Done${end_color}"
echo -e