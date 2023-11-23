#!/bin/bash

## Download Arima Hi-C raw reads (Ilumina paired-end)
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR184/099/SRR18462899/SRR18462899_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR184/099/SRR18462899/SRR18462899_1.fastq.gz


### Haplotype-1:

https://www.ncbi.nlm.nih.gov/datasets/genome/GCA_024256435.1/

### Haplotype-2:

https://www.ncbi.nlm.nih.gov/datasets/genome/GCA_024256465.1/


### Primary assembly:

https://www.ncbi.nlm.nih.gov/datasets/genome/GCF_024256425.1/




#=====================================================================================
## TASK 1:
# We aim to generate comparative Hi-C heatmaps for each of the 28 chromosomes in both Hap1 and Hap2.
# For example, comparing the Hi-C heatmap of Chr1 in Hap1 to that of Chr1 in Hap2, side by side.
# This will help identify regions in the assembly with potential issues such as
# misassemblies or structural rearrangements. 
#==================================================================================

##TASK 2:
# Generate for the primary assembly a Hi-C contact heat map
