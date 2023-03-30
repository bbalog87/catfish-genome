#!/bin/bash

set -e

export PATH='/NABIC/soft/jellyfish/jellyfish-1.1.10/bin/':$PATH

trimmed_reads_path="/NABIC/HOME/yedomon1/genomeassemblyfungiMR004/01_Genome_size_estimation/trimmed_reads"

size_estimation_working_path="/NABIC/HOME/yedomon1/genomeassemblyfungiMR004/01_Genome_size_estimation"

r_script_path="/NABIC/soft/R/R-2.15.2/bin" 

genomescope_path="/NABIC/HOME/yedomon1/genomescope-master"


echo "Create the jellyfish file..."

jellyfish count -C -m 19  -s 30000000000 -t 10 \
          $trimmed_reads_path/*.trim.* \
          -o $size_estimation_working_path/MR4003_19mer.jf 


echo "Create the histogram file..."

jellyfish histo -t 10 \
          $size_estimation_working_path/MR4003_19mer.jf_0 > \ 
          $size_estimation_working_path/MR4003_19mer_.histo


echo "Size estimation with genomescope..."

$r_script_path/Rscript \
          $genomescope_path/genomescope.R \
          $size_estimation_working_path/MR4003_19mer_.histo 19 151 \
          $size_estimation_working_path/ 10000

echo "Job is completed!"
