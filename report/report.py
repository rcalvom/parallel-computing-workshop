from matplotlib import pyplot as plt
from pylatex import Document, Section, Subsection, Figure, NoEscape

import os
import numpy as np

cd = os.path.dirname(os.path.abspath(__file__))
threads = [1, 2, 4, 8, 16]

def generate_plots():
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
                results[image_type][n_threads].append(float(line.strip().split()[-1]))
    print(results)
    for i_type, i_results in results.items():
        seq_time = np.average(i_results[1])
        par_times = []
        for thread in threads:
            par_times.append(np.average(i_results[thread]))
        speedup = [seq_time / par_time for par_time in par_times]
        fig1, ax1 = plt.subplots()
        ax1.plot(threads, par_times)
        ax1.set(xlabel='Number of threads', ylabel='Response time (s)', title='N° of Threads vs Response Time')
        ax1.grid()
        fig1.savefig(cd + f'/plots/{i_type}_response_time.png')
        fig2, ax2 = plt.subplots()
        ax2.plot(threads, speedup)
        ax2.set(xlabel='Number of threads', ylabel='Speedup (s)', title='N° of Threads vs Speedup')
        ax2.grid()
        fig2.savefig(cd + f'/plots/{i_type}_speedup.png')
    print('Plots generated successfully')

def generate_report():
    doc = Document()
    with doc.create(Section('Parallel Computing Workshop')):
        with doc.create(Subsection('Matplotlib Plots')):
            for plot in os.listdir(cd + '/plots'):
                with doc.create(Figure(position='h!')) as f_plot:
                    f_plot.add_image(cd + f'/plots/{plot}', width='400px')
                    f_plot.add_caption(plot.strip().split('.')[0])
    doc.generate_pdf(filepath=cd + '/report', compiler='C:/Users/JORGE AURELIO MORALE/AppData/Local/Programs/MiKTeX/miktex/bin/x64/pdflatex', clean_tex=False)
    print('Report generated successfully')

if __name__ == '__main__':
    generate_plots()
    generate_report()
