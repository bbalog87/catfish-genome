#!/bin/bash

set -e


export PATH='/NABIC/HOME/yedomon1/soft/Trimmomatic-0.38/':$PATH


untrimmed_reads_path="/NABIC/HOME/yedomon1/genomeassemblyfungiMR004/01_Genome_size_estimation/untrimmed_reads"

trimmed_reads_path="/NABIC/HOME/yedomon1/genomeassemblyfungiMR004/01_Genome_size_estimation/trimmed_reads"


cd $trimmed_reads_path


for infile in $untrimmed_reads_path/*_R1_001.fastq

do

base=$(basename ${infile} _R1_001.fastq)

java -jar trimmomatic.jar PE -threads 32 -phred33 \
  -trimlog trimLogFile \ 
  -summary statsSummaryFile \
  ${infile} ${base}_R2_001.fastq \
  ${base}_1.trim.fastq.gz ${base}_1un_trim_fastq.gz \
  ${base}_2.trim.fastq.gz ${base}_2un_trim_fastq.gz \
  ILLUMINACLIP:/NABIC/HOME/yedomon1/soft/Trimmomatic-0.38/adapters/TruSeq3-PE.fa:2:30:10 \
  LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36

done


echo "Job is completed!"
