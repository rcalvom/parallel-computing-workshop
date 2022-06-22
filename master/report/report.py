"""Report generator"""

# Matplotlib
from matplotlib import pyplot as plt

# Numpy
import numpy as np

# System
import os


cd = os.path.dirname(os.path.abspath(__file__))
processes = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16]


def generate_plots():
    """Generate plots from data"""
    results = {}
    for element in os.listdir(cd + '/out'):
        filename_parts = element.split('.')[0].split('_')
        image_type = filename_parts[-2]
        if image_type not in results.keys():
            results[image_type] = {}
        n_processes = int(filename_parts[-1])
        if n_processes not in results[image_type].keys():
            results[image_type][n_processes] = []
        with open(cd + f'/out/{element}', 'r', encoding='utf-8') as r_file:
            for line in r_file.readlines():
                results[image_type][n_processes].append(
                    float(line.strip().split()[-1]))
    for i_type, i_results in results.items():
        seq_time = np.average(i_results[1])
        par_times = []
        for process in processes:
            par_times.append(np.average(i_results[process]))
        speedup = [seq_time / par_time for par_time in par_times]
        fig1, ax1 = plt.subplots()
        ax1.plot(processes, par_times)
        ax1.set(xlabel='Number of processes', ylabel='Response time (s)',
                title='N° of processes vs Response Time')
        ax1.grid()
        fig1.savefig(cd + f'/plots/mpi_{i_type}_response_time.png')
        fig2, ax2 = plt.subplots()
        ax2.plot(processes, speedup)
        ax2.set(xlabel='Number of processes', ylabel='Speedup (s)',
                title='N° of processes vs Speedup')
        ax2.grid()
        fig2.savefig(cd + f'/plots/mpi_{i_type}_speedup.png')
    print('Plots generated successfully')


if __name__ == '__main__':
    """Main method"""
    generate_plots()
