#!/bin/bash

set -e

export PATH='/NABIC/HOME/yedomon1/soft/FastQC/':$PATH

untrimmed_reads_path="/NABIC/HOME/yedomon1/genomeassemblyfungiMR004/01_Genome_size_estimation/untrimmed_reads"

qc_results_path="/NABIC/HOME/yedomon1/genomeassemblyfungiMR004/01_Genome_size_estimation/qc_results"

qc_summary_doc_path="/NABIC/HOME/yedomon1/genomeassemblyfungiMR004/01_Genome_size_estimation/qc_results/qc_summary_files"


cd $untrimmed_reads_path

echo "Running FastQC ..."

fastqc *.fastq

mkdir -p $qc_results_path/fastqc_untrimmed_reads

echo "Saving FastQC results..."

mv *.zip $qc_results_path/fastqc_untrimmed_reads

mv *.html $qc_results_path/fastqc_untrimmed_reads

cd $qc_results_path/fastqc_untrimmed_reads

echo "Unzipping..."

for filename in *.zip
    do
    unzip $filename
    done

echo "Saving summary..."

cat */summary.txt > $qc_summary_doc_path/fastqc_untrimmed_summaries.txt

echo "Job is completed!"
