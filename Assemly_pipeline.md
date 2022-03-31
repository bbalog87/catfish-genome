## Raw summary of methods used in the T2T assembly of the African catfsih genome 

Here, we document all steps to achieve chromosome-level telomere-to-telomrere (T2T) assembly, from the input data to the final hplotype-resolved, 
gap-filled and polished asemblies.

### Summary of generated sequencing data
Tissues from the same single male adult animal (fish) was used to extract DNA for all samples.
- **HiFi reads:**
High fildelity (HiFi) reads data were produced using the circular consensus sequencing (CCS) mode of the PacBio Sequel systems. 
A total of 8,509,466 CCS reads with an avearge N50 reads length of ~16 Kb were yielded, achieving an overall genome coverage of 118x. HiFi reads have an average base-level accuracy of >99.6% (Q25). These data were mainly used to compute the primary assemblies.
- **ONT reads:** Oxford Nanopre Technologies (ONT) long reads were additionally produced on a PromethION 2 system. A total of 4,067,755
ONT reads wih N50 of 32 Kb and mean quality of >90% (Q10). ONT reads yielded an average genome coverage of 80x. Nanopore data were mainly utilized in haplotype phasing and to fill the gaps in the chomomosomes-level assemblies.
- **Illumina PE-150:** Illumina Paired-end (2 x 150 bp, PE-150) data were generated on a Novaseq 6000 plateform. A total of 308,119,418 PE-150 reads were obtained with an average accuarcy of 99.7% (Q25). Illumina were mainly used in the genome survey analyis, haplotypes phasing and genpme polishing.
- **Hi-C data:** Chromosome Confirmation Capture data (Hi-C) were generated and sequencing on illumina HiSeq X plateform. A total of 181,719,601 PE-150 reads were obtained with a overall genome coverage of 24x. The Hi-C data were mainly used for chromosome-scaffolding, to pahse haplotype and corrects assembly errors.

**Table 1:** Summary of generated sequencing data 

| **Sequencing platform** | **Data type**        | **Number of reads** | **Number of bp** |
|-------------------------|----------------------|---------------------|------------------|
| Sequel IIe              | HiFi/CCS             | 8,509,466             | 132,799,182,531     |
| PromethION 2            | Nanopore             | 4,067,755             | 89,549,113,696      |
| NovaSeq 6000            |  Illumina PE-150     | 308,119,418           | 92,289,157,730      |
| HiSeq X Ten             | Illumina PE-150 Hi-C | 181,719,601           | 27,439,59,751      |

### Genome survey analysis
We performed a genome survey analysis (GSA) to gain insights into a preliminary global view of a genome prooerties, including estimated (theoretical) genome size, expected repetitive sequences content and estimated heterozygosity. For k-mer analysis, we used the [K-mer Analysis Toolkit (KAT)](https://github.com/TGAC/KAT), [jellyfish (vers. 2.3.0)](https://github.com/gmarcais/Jellyfish) and custom R scripts.\
For a given sequence  S of length L,  a k-mer is subsequence of size k. The total possible number of k-mers will be given by *( L – k ) + 1*

**a) Count k-mer occurrence using Jellyfish 2.2.6 for k=19,21,27,41**
``` bash
KList={19,21,27,41}
 for i in $Klist;
do 
 jellyfish count -t 64 -C -m $i -s 5G -o {i}mer_out ;
done
```
These k-mers count were used to plot k-mer histogram and to estime the genome proporties. The estimated genome size of the African catfished rangen from 963 Mb to 1000 Mb depnding on the chosen k-mer size. The genome seem to be higly heterozygous, with an average estimated heterozygosity rate of 1.2% (i.e. 12 SNPs per Kbp). since the single-copy portion of the genome is estimnated to ~42% based on k-mer analysis, we expect around 60% of repetitive sequences content in this genome.

### Summary of T2T assembly workflow
We aim to build a fully haplotype-resolved chromosome-sacle assembly, possibly T2T. We refer the **diploid assembly (Prim)** as "Primary". The primary assembly is a more contigous pseudo-haplotype assembly with alternating long stretches of phased blocks, that captures both the homozygous regions along with a single copy of the heterozygous alleles. **Haplotype-1 (Hap1)** and **Haplotype-2 (Hap2)** are haploid assemblies consisting of haplotigs, representing the entire diploid genome. Hence,  Hap1 and Hap2 represent the two parental haplotypes of the diploid genome.

#### a) Step 1: Primary genome assembly
We used the haplotype-resolved assembler [hifiasm (vers.0.16.1)](https://github.com/chhylp123/hifiasm) to assemble the Prim assembly with clean HiFi and Hi-C data. 
```bash
## Input pooled HiFi data
AB=catfish.HiFi.clean.fa.gz
## Hi-C reads data
HICreads1=21108D-01-01-01_S108_L001_R1_001.fastq.gz
HICreads2=21108D-01-01-01_S108_L001_R2_001.fastq.gz

## Hifiasm assembly pipeline
		  
echo "===== ASSEMBLYING $AB : Pool of all clean HiFi samples ========"

/usr/bin/time -o out.ABrun.time.ram.txt -v \
hifiasm -o AB.asm \
          -t 91 \
		  --hg-size 1200m \
		  --hom-cov 131 -l3  -s 0.35 \
		  --h1 $HICreads1 \
		  --h2 $HICreads2 \
		  $AB
      
## Extract contigs from gfa files
 for FILE in *ctg.gfa; do
awk '/^S/{print ">"$2;print $3}' $FILE > ${FILE%%.gfa}.fa	  

done

```
Benchmarking Universal Single-Copy Orthologs (BUSCO) showed that the primary aasembly contained a high level of haplotipic duplication (26%). 
To reduice these false duplication, we purged haplotypic duplications using successively [purge_dups](https://github.com/dfguan/purge_dups) and [purge_haplotigs](https://bitbucket.org/mroachawri/purge_haplotigs/src/master/) pipelines, perfprming two and one rounds, respectively.\

The BUSCO duplication rate in the purged primary assembly was dramtically reduced from 26% to 1.2%, which more realistic as compred with closely related catfishes.

```
Completeness Assessment Results: \
        Total # of core genes queried:    3640\
        # of core genes detected\
                Complete:    3547 (97.45%)\
                Complete + Partial:    3563 (97.88%)\
        # of missing core genes:    77 (2.12%)\
        Average # of orthologs per core genes:    1.02\
        % of detected core genes that have more than 1 ortholog:    1.27\
        Scores in BUSCO format:    C:97.4%[S:96.2%,D:1.2%],F:0.4%,M:2.2%,n:3640

  ```
 
  #### b) Step 2: Chromosme-scaffolding of the primary assembly
The Hi-C reads were leveraged in the  modified [Arima mapping pipeline](https://github.com/ArimaGenomics/mapping_pipeline) to order and orient contigs into chromosomes.
- a) Hi-C PE-reads were mapped the Prim assembly using bwa-mem
- b) Alignement was post-processed: filtred, sorted by coordinate and duplicates makrked
- c) Post-processed aligment was used in [SALSA2](https://github.com/marbl/SALSA) to generate Chromosome-level scaffolds. 
- d) [TGS-GapCloser](https://github.com/BGI-Qingdao/TGS-GapCloser) was used with corrected ONT reads to fill all gaps in the scaffolds, achieving a fully gapless chomosome-level primary assembly.
 
 
#### b) Step 2: Reads partioning in Haplotypes-specific reads, Haplotype-resolved assemblies with Hifiasm
The following procedure was followed to infer phased (haplotype-specific) HiFi reads, which were then assembled independently with Hifiasm.

1. Mapping:
 - Mapp HiFi reads to prim assembly ( Minimap2)
 - Map ONT to pim assembly (minimap2)
 - Map Hi-C read to prim assembly (bwa-mem)
 - map illumina to prim assembly (bwa-mem)

2. Call SNPs variants in HiFi alignement file (bam) using NanoCaller pipeline ==> outpüut VCF file

3. Phase the variants in 2) using WhatsHap with input of other bam files (ONT.bam, Illumina.bam, HiC.bam)

4. In the phased bam file obitained in 3) extract phased reads  specific to Hap1 and Hap2 respectively.

5. Merging hoplotype-spcific phased reads withunphased reads (possibly homozygous reads):\
 a) Hap1+Homozygous reads
 b) Hap2+ Homozygous reads

6. Use Hifiasm to assemble reads in 5a) and in 5b) separately 

7. Use the primary assembly as reference to Scaffold
 (genome-guided Scaffolding) the contigs-level assemblies obtained in 6), inclusing Hap1 and hap2.
 
8. Fill the gap in Hap1 and Hap2 with TSG-gapCloser
9. Polish the Primary assmebly, Hap1 and Hap2 with NextPolish+Hapo-G
10. Decontamination (Blast, Kraken2), QC, asssessmemht and validation of Prim, Hap1, and Hap2 assemblies.


