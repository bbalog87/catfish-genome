
## BIOPROJECT: Clarias gariepinus Transcriptome (PRJNA487132) | [NCBI Link](https://www.ncbi.nlm.nih.gov/search/all/?term=PRJNA487132)

Four SRAs available | [Link](https://www.ncbi.nlm.nih.gov/sra?linkname=bioproject_sra_all&from_uid=487132)

### - SRA1: SRX4609825 | Illumina HiSeq 4000 paired end sequencing; RNA-Seq of Clarias gariepinus: juvenile spleen

Run: SRR7753901 | [Info link](https://www.ebi.ac.uk/ena/browser/view/SRR7753901?show=reads) | 

Download: 

```
wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR775/001/SRR7753901/SRR7753901_1.fastq.gz
wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR775/001/SRR7753901/SRR7753901_2.fastq.gz

```


### - SRA2: SRX4609824 | Illumina HiSeq 4000 paired end sequencing; RNA-Seq of Clarias gariepinus: juvenile spleen

   Run: SRR7753902 | [Info link](https://www.ebi.ac.uk/ena/browser/view/SRR7753902?show=reads) | 
   
   
```
wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR775/002/SRR7753902/SRR7753902_1.fastq.gz
wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR775/002/SRR7753902/SRR7753902_2.fastq.gz

```
   
   
   
### - SRA3: SRX4609823 | Illumina HiSeq 4000 paired end sequencing; RNA-Seq of Clarias gariepinus: juvenile spleen

   Run: SRR7753903 | [Info link](https://www.ebi.ac.uk/ena/browser/view/SRR7753903?show=reads) | 
   
   
```
wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR775/003/SRR7753903/SRR7753903_1.fastq.gz
wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR775/003/SRR7753903/SRR7753903_2.fastq.gz

```
   

### - SRA4: SRX4609822 | Illumina HiSeq 4000 paired end sequencing; RNA-Seq of Clarias gariepinus: juvenile spleen

   Run: SRR7753904 | [Info link](https://www.ebi.ac.uk/ena/browser/view/SRR7753904?show=reads) | 
   
   
```
wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR775/004/SRR7753904/SRR7753904_1.fastq.gz
wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR775/004/SRR7753904/SRR7753904_2.fastq.gz

```

### 1)- Quality Check of the RNA-Seq reads | FastQC - [Info link](https://www.bioinformatics.babraham.ac.uk/projects/fastqc/)

```bash
mkdir QC_out
fastqc -o QC_out -t 90  SRR*.fastq.gz

```
RNA-seq reads clean and do not need further filtering aor trimming for downstream analyses. An axample can be ssen in sample SRR7753901.
[SRR7753901_1_fastqc.zip](https://github.com/bbalog87/catfish-genome/files/8351519/SRR7753901_1_fastqc.zip)


### 1)- Trancriptome assembly
- #### De novo assembly with Trinity vers.2.14

```bash
./Trinity --left SRR7753904_1.fastq.gz,SRR7753904_1.fastq.gz,SRR7753902_1.fastq.gz,SRR7753901_1.fastq.gz \
          --right SRR7753904_2.fastq.gz,SRR7753904_2.fastq.gz,SRR7753902_2.fastq.gz,SRR7753901_2.fastq.gz \
		  --CPU 90 --full_cleanup --output Trinity-RNA_OUT --seqType fq --max_memory 300G
```
