#!/bin/bash

# Install required packages
sudo apt-get update
sudo apt-get install openmpi-bin openmpi-common libopenmpi-dev nfs-kernel-server nfs-common

# Save path of NFS into exports file to allow access to remore hosts (rcalvom is the username)
echo "/home/rcalvom/parallel-computing-workshop *(rw,sync,no_subtree_check)" > /etc/exports

# Restart Network File System Kernel Service
sudo systemctl restart nfs-kernel-server

# Export Networl File System Folder
sudo exportfs -a