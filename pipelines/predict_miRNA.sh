#!/bin/bash



## replace Uby T, sort by length and remove duplicates 
grep -v ">" mature.miRNA.catalog.fa | sed 's/U/T/g' | sort | uniq | awk
'BEGIN{i=1}; {print ">seq_"i++; print}' > mirnas.fa


### filter short (<18 nt) miRNAs
fastaparse.pl mirnas.fa -a 18 > mirnas_no_short.fa 2>mirnas_too_short

## Map mature (filtered) miRNA to catfish genome

## build bowtie index 
bowtie -p 1 -f -n 0 -e 80 -l 18 -a -m 5 --best --strata

## Map mature miRNA
bowtie -p 1 -f -n 0 -e 80 -l 18 -a -m 5 --best --strata genome  --al mature.fa_mapped --un mature.fa_not_mapped  mirnas_no_short.fa  mappings.bwt

## Convert bowtie output
convert_bowtie_output.pl mappings.bwt > mappings.arf


## Clean and prepare files dfor mirdeep2
cat mappings.arf | sed 's/seq_//' | awk 'BEGIN{OFS="\t"}
{$1="001_"$1"_x1"; print}' > mappings_for_mirdeep2.arf

cat mature.fa_mapped | sed 's/>seq//' | awk '/_/{print ">001"$0"_x1";
next} {print}' > mature_for_mirdeep2.fa

##Predict miRNA loci with mirdeep2

miRDeep2.pl mature_for_mirdeep2.fa zander.genome.for.miRNA.dectection.fa mappings_for_mirdeep2.arf none none none