#!/bin/bash


# Whathap phasing

whatshap phase -o AC.phased.snp.vcf.gz \
              --reference AC.fa \
			  --output-read-list phased.reads.txt\
			  --ignore-read-groups \
			  --distrust-genotypes \
			  --include-homozygous \
			  AC.vcf \
			  CCS/AC.sorted.bam \
			  ILN/AC.ILM.bam\
			  HiC/AC.unique.bam\
			  ONT/AC.ONT.bam 
			  
			  
 ## Split reads by haplotype
 
 whatshap split phased.reads.txt  CCS/AC.sorted.bam \
         --output-h1 CCS.hap1.fastq.gz \
		 --output-h2 CCS.hap2.fastq.gz \
		 --add-untagged \
		 --read-lengths-histogram  reads.haplotype.histo.txt
		 
		 

          


