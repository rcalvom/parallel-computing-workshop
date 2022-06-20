#!/bin/bash

# Install required packages
sudo apt-get update
sudo apt-get install openmpi-bin openmpi-common libopenmpi-dev nfs-common

# Create folder for mount NFS partition
mkdir -p parallel-computing-workshop 

# Mount NFS partition from master node to local slave node (rcalvom is the username)
sudo mount -t nfs node-0:/home/rcalvom/parallel-computing-workshop /home/rcalvom/parallel-computing-workshop

# Umount NFS partition
#sudo umount /home/rcalvom/parallel-computing-workshop  -f -l