#!/bin/bash

## Functional annotation using funannotate pipeline
funannotate predict -i CGAR.genome.fa.masked \
                    -o CGAR_Funannotate200422 \
					-s Clarias --isolate MV21 \
					--other_gff total.fa.genscan.gff:1\
					--rna_bam catfish.RNA-Seq.aligned.bam \
					--busco_seed_species zebrafish \
					--optimize_augustus \
					--busco_db actinopterygii \
					--organism other\
					--ploidy 2 \
					--protein_evidence catfish.proteins.merged.fa \
					--transcript_alignments catfish.EST.merged.gff \
					--min_intronlen 20\
					--max_intronlen 50000 \
					--repeats2evm --keep_evm \
					--cpus 90 \
					--weights codingquarry:1 augustus:2 glimmerhmm:0 genemark:0 proteins:4 HiQ:6
