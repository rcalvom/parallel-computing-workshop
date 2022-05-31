"""Report generator"""

# Matplotlib
from matplotlib import pyplot as plt

# Numpy
import numpy as np

# System
import os


cd = os.path.dirname(os.path.abspath(__file__))
blocks = [1, 2, 4, 8, 16, 32, 64]
threads = [1, 2, 4, 8, 16, 32, 64, 128]


def generate_plots():
    """Generate plots from data"""
    results = {}
    for element in os.listdir(cd + '/out'):
        filename_parts = element.split('.')[0].split('_')
        if len(filename_parts) < 5:
            continue
        image_type = filename_parts[-3]
        if image_type not in results.keys():
            results[image_type] = {}
        n_blocks = int(filename_parts[-2])
        n_threads = int(filename_parts[-1])
        if n_blocks not in results[image_type].keys():
            results[image_type][n_blocks] = {}
        if n_threads not in results[image_type][n_blocks].keys():
            results[image_type][n_blocks][n_threads] = []
        with open(cd + f'/out/{element}', 'r', encoding='utf-8') as r_file:
            for line in r_file.readlines():
                results[image_type][n_blocks][n_threads].append(
                    float(line.strip().split()[-1]))
    for i_type, i_results in results.items():
        fig1, ax1 = plt.subplots()
        ax1.set(xlabel='Number of threads', ylabel='Response time (s)',
                title=f'N° of Threads vs Response Time ({i_type})')
        ax1.grid()
        fig2, ax2 = plt.subplots()
        ax2.set(xlabel='Number of threads', ylabel='Speedup (s)',
                title=f'N° of Threads vs Speedup ({i_type})')
        ax2.grid()
        seq_time = np.average(i_results[1][1])
        for block_count, b_results in i_results.items():
            par_times = []
            for thread in threads:
                par_times.append(np.average(b_results[thread]))
            speedup = [seq_time / par_time for par_time in par_times]
            label = f'{block_count} blocks' if block_count > 1 else f'{block_count} block'
            ax1.plot(threads, par_times, label=label)
            ax2.plot(threads, speedup, label=label)
        ax1.legend()
        ax2.legend()
        fig1.savefig(cd + f'/plots/cuda_{i_type}_response_time.png')
        fig2.savefig(cd + f'/plots/cuda_{i_type}_speedup.png')
    print('Plots generated successfully')


if __name__ == '__main__':
    """Main method"""
    generate_plots()
