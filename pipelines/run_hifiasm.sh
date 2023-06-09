#!/usr/bin/bash

#====================================================
#### Perform    Hifi + Hi-C  assembling  with  hifiasm
#=======================================================


############ INPUT DATA #####

# HiFi reads 
AB=/projekte/I3-PikeperchAssembly/CATFISH-PROJECT/catfish.HiFi.clean.fa.gz

## Hi-C reads data
HICreads1=/projekte/I3-PikeperchAssembly/CATFISH-PROJECT/21108D-01-01-01_S108_L001_R1_001.fastq.gz
HICreads2=/projekte/I3-PikeperchAssembly/CATFISH-PROJECT/21108D-01-01-01_S108_L001_R2_001.fastq.gz


## Hifiasm assembly pipeline

		  
echo "===== PROCESSING $AB : Pool of all clean HiFi samples ========"



/usr/bin/time -o out.ABrun.time.ram.txt -v \
./hifiasm -o AB.asm \
          -t 91 \
		  --hg-size 1000m \
		  --hom-cov 134 -l3  -s 0.35 \
		  --n-perturb 75000 \
		  --f-perturb 0.15 \
		  --n-weight 5 \
		  --h1 $HICreads1 \
		  --h2 $HICreads2 \
		  $AB
		  
## Obtain assemblies FASTA files
for FILE in *ctg.gfa; do
awk '/^S/{print ">"$2;print $3}' $FILE > ${FILE%%.gfa}.fa	 
		  
		  
