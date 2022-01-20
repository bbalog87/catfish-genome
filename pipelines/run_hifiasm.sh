#!/usr/bin/bash

#====================================================
#### Perform    Hifi + Hi-C  assembling  with  hifiasm
#=======================================================


############ INPUT DATA #####

# HiFi reads 

#HIFI=/projekte/I3-PikeperchAssembly/CATFISH-PROJECT/catfish-HiFi.fa
D01=/projekte/I3-PikeperchAssembly/CATFISH-PROJECT/D01.HiFi.fasta.gz
E01=/projekte/I3-PikeperchAssembly/CATFISH-PROJECT/E01.HiFi.fasta.gz
F01=/projekte/I3-PikeperchAssembly/CATFISH-PROJECT/F01.HiFi.fasta.gz
D09=/projekte/I3-PikeperchAssembly/CATFISH-PROJECT/D09.HiFi.fasta.gz
AB=/projekte/I3-PikeperchAssembly/CATFISH-PROJECT/catfish.HiFi.clean.fa.gz

## Hi-C reads data
HICreads1=/projekte/I3-PikeperchAssembly/CATFISH-PROJECT/21108D-01-01-01_S108_L001_R1_001.fastq.gz
HICreads2=/projekte/I3-PikeperchAssembly/CATFISH-PROJECT/21108D-01-01-01_S108_L001_R2_001.fastq.gz


## Hifiasm assembly pipeline

		  
echo "===== PROCESSING $AB : Pool of all clean HiFi samples ========"



/usr/bin/time -o out.ABrun.time.ram.txt -v \
./hifiasm -o AB.asm \
          -t 91 \
		  --hg-size 1200m \
		  --hom-cov 131 -l3  -s 0.35 \
		  --n-perturb 75000 \
		  --f-perturb 0.15 \
		  --n-weight 5 \
		  --h1 $HICreads1 \
		  --h2 $HICreads2 \
		  $AB



echo "===== PROCESSING $D01 ========"
/usr/bin/time -o out.D01run.time.ram.txt -v \
./hifiasm -o D01.asm \
          -t 91\
		  --f-perturb 0.15 \
		  --n-perturb 75000 \
		  --n-weight 5 \
		  --hg-size 1200m \
		  --hom-cov 30  -l3  -s 0.35 \
		  --h1 $HICreads1 \
		  --h2 $HICreads2 \
		  $D01
		  
		  

echo "===== PROCESSING $E01 ========"
/usr/bin/time -o out.E01run.time.ram.txt -v \
./hifiasm -o E01.asm \
          -t 91 \
		  --f-perturb 0.15 \
		  --n-perturb 75000 \
		  --n-weight 5 \
		  --hg-size 1200m \
		  --hom-cov 30  -l3  -s 0.35 \
		  --h1 $HICreads1 \
		  --h2 $HICreads2 \
		  $E01
		  



echo "===== PROCESSING $F01 ========"
/usr/bin/time -o out.F01run.time.ram.txt -v \
./hifiasm -o F01.asm \
          -t 91 \
		  --f-perturb 0.15 \
		  --n-perturb 75000 \
		  --n-weight 5 \
		  --hg-size 1200m \
		  --hom-cov 36  -l3  -s 0.35 \
		  --h1 $HICreads1 \
		  --h2 $HICreads2 \
		  $F01
		  
		  
		  
echo "===== PROCESSING $D09 ========"
/usr/bin/time -o out.D09run.time.ram.txt -v \
./hifiasm -o D09.asm \
          -t 91 \
		  --f-perturb 0.15 \
		  --n-perturb 75000 \
		  --n-weight 5 \
		  --hg-size 1200m \
		  --hom-cov 28  -l3  -s 0.35 \
		  --h1 $HICreads1 \
		  --h2 $HICreads2 \
		  $D09

##!/usr/bin/bash
for FILE in *ctg.gfa; do
awk '/^S/{print ">"$2;print $3}' $FILE > ${FILE%%.gfa}.fa	  

done

		  
		  
		  
