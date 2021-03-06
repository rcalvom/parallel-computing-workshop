"""Report generator"""

# Matplotlib
from matplotlib import pyplot as plt

# Numpy
import numpy as np

# System
import os


cd = os.path.dirname(os.path.abspath(__file__))
threads = [1, 2, 4, 8, 16]


def generate_plots():
    """Generate plots from data"""
    results = {}
    for element in os.listdir(cd + '/out'):
        filename_parts = element.split('.')[0].split('_')
        image_type = filename_parts[-2]
        if image_type not in results.keys():
            results[image_type] = {}
        n_threads = int(filename_parts[-1])
        if n_threads not in results[image_type].keys():
            results[image_type][n_threads] = []
        with open(cd + f'/out/{element}', 'r', encoding='utf-8') as r_file:
            for line in r_file.readlines():
                results[image_type][n_threads].append(
                    float(line.strip().split()[-1]))
    for i_type, i_results in results.items():
        seq_time = np.average(i_results[1])
        par_times = []
        for thread in threads:
            par_times.append(np.average(i_results[thread]))
        speedup = [seq_time / par_time for par_time in par_times]
        fig1, ax1 = plt.subplots()
        ax1.plot(threads, par_times)
        ax1.set(xlabel='Number of threads', ylabel='Response time (s)',
                title='N° of Threads vs Response Time')
        ax1.grid()
        fig1.savefig(cd + f'/plots/{i_type}_response_time.png')
        fig2, ax2 = plt.subplots()
        ax2.plot(threads, speedup)
        ax2.set(xlabel='Number of threads', ylabel='Speedup (s)',
                title='N° of Threads vs Speedup')
        ax2.grid()
        fig2.savefig(cd + f'/plots/{i_type}_speedup.png')
    print('Plots generated successfully')


if __name__ == '__main__':
    """Main method"""
    generate_plots()
