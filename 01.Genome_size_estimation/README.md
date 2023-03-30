> Prior the genome size estimation, short-reads data were quality checked and trimmed.

## Tools
### Short reads quality control and trimming
* FastQC v0.11.8
* Trimmomatic v0.38

### Genome size estimation
* jellyfish v1.1.10
* Rscript v2.15.2
* Genomescope v1.0.0

## Running
### Quality control of short-reads


[`bash run_fastqc.sh`](https://github.com/Yedomon/Genome_Assembly_Fusarium_oxysporum_f.sp._sesami/blob/master/01.Genome_size_estimation/run_fastqc.sh)



### Trimming

[`bash run_trimmomatic.sh`](https://github.com/Yedomon/Genome_Assembly_Fusarium_oxysporum_f.sp._sesami/blob/master/01.Genome_size_estimation/run_trimmomatic.sh)



### Genome size estimation

[`bash run_jellyfish_genomescope.sh`](https://github.com/Yedomon/Genome_Assembly_Fusarium_oxysporum_f.sp._sesami/blob/master/01.Genome_size_estimation/run_jellyfish_genomescope.sh)


## References
* Andrews S (2010) FastQC: A Quality Control Tool for High Throughput Sequence Data. Available [online](http://www.bioinformatics.babraham.ac.uk/projects/fastqc/)
* Marçais G, Kingsford C (2011) Fast, lock-free approach for efficient parallel counting of occurrences of k-mers. Bioinformatics 27(6):764–770. [DOI](https://doi.org/10.1093/bioinformatics/btr011)
* R Core Team, R: A Language and Environment for Statistical Computing, R Foundation for Statistical Computing, Vienna, Austria, 2012.
* Vurture, Sedlazeck FJ, Nattestad M, Underwood CJ, Fang H, Gurtowski J, Schatz MC (2017) GenomeScope: fast reference-free genome profiling from short reads. Bioinformatics, 33(14):2202–2204. [DOI](https://doi.org/10.1093/bioinformatics/btx153)
