
# Process Cafe5 output to extract genes families in expansion and contraction on ecah branch

The changes in each gene xfamily and for each axa are recorde in the file named _Base_change.tab_. 
the fisrt column is the represnt familyIds. FRom column 2 on, the braches inclusding taxa. A posituve (>0) counts for a taxon X 
means this gene family is exapnding for taxon X. A negative count means contracting geen family.

## Exact genes family in expansion or contracvtion in each branch 

```bash


## get column names 
#HEADER= $(head -1 Base_change.tab)
COLUMN=(2 3 4 5 6 8 10 11 12 13 14 18 20 26)

for i in ${!COLUMN[@]}; do 

#Format taxa name
 taxname=$(cut -f${COLUMN[$i]} Base_change.tab | head -1 | cut -f1 -d "<")

## Extract gene in extension for taxa
awk '${COLUMN[$i]} >0 {print $1,${COLUMN[$i]}' Base_change.tab > Expansions.${taxname}.txt

## extract gene in contraction for taxa
awk '${COLUMN[$i]}  < 0 {print $1,${COLUMN[$i]}' Base_change.tab > Contractions.${taxname}.txt

# Obtain only significant OG
grep "$taxname\*" Base_asr.tre |awk '{print ${COLUMN[$i]}' >Sig.changes.${taxname}.txt

```
Unfortunately, even geneID can't be downlaod by a single click. Information of each gene need to be exported manually to a TSV file.
There are around 50 reported HRG in fish with ~1900 orthologs in different fish species (Last accessed: 10.05.2022).

## Clean files and extract GeneID
The pattern "**more..**" is the most distinctive expression between "GeneNames" and "geneID" lines. Therefore, we'll grep geneIDs based on this pattern.
```bash
#!/bin/bash

PATTERN="more.."
for FILE in ge*.txt ; do
grep -w $PATTERN $FILE | cut -f1-3 >> hypoxia_geneID.txt
done
```

## Create an environment with python 3

```python

conda create --name ncbidownload_env python=3.8

```


## Activate the environment and install the tools

```python

conda install -c conda-forge mamba # install mamba which is far more fasta thana conda
conda activate ncbidownload_env 
mamba install -c bioconda ncbi-genome-download #tool 1
mamba  install -c bioconda ncbi-acc-download # tool2
mamba  install -c bioconda entrez-direct # tool3

```


## Download refseq transcript sequences of HRG  reported in [HRGFish](https://mail.nbfgr.res.in/HRGFish/index.php) database.



```python
 cut -f1 hypoxia_geneID.txt  > GeneID.txt ## GeneID
for ID in $(cat GeneID.txt); do
elink -db gene -id $ID  -target nuccore -name gene_nuccore_refseqrna | efetch -format fasta >> fish.HRG.mRNA.fa

done
```
 
 In total 3906 transcripts of HRGs were fetched from NCBI:

 ```
 grep ">" fish.HRG.mRNA.fa | wc -l
 3806
 ```

## Blast HRGs against predicted  A. catfish proteins and retain topHits
```bash
makeblastdb -in catfish_ND21.proteins.fa \
-dbtype prot \
-title hyporot \
-parse_seqids \
-out PROT\

blastx -query fish.HRG.mRNA.fa \
-db PROT -evalue 1e-10 \
-num_threads 80 \
-max_target_seqs 1 \
-outfmt 1 \
-out Hypo.protein.topHit.blast

```
We found 414 unique top Blast hits suggesting potential hypoxia responsive gene loci in A. catfish genome.

```

cut -f2 Hypo.protein.topHit.blast |uniq | wc -l
414
```





## Extract blast topHits from the A. catfish gff3 genome annoation file and convert output to bed format

Remove duplicates Hypoxia responsive genes hits


```
cut -f2 Hypo.protein.topHit.blast |uniq | sed s/-T1/\;/ > CGAR.HRG.loci.txt
```

Extract genes postion from Gff3

```R
grep -Fw -f CGAR.HRG.loci.txt  catfish_ND21.gff3 > CGAR.HRG.loci.gff # as gff
grep -Fw -f CGAR.HRG.loci.txt  catfish_ND21.gff3 | cut -f1,4,5 > CGAR.HRG.loci.gff # Chr# with genes postions (BED)
```

**Note: We have for somes genes, overlapping coordinates or very close loci. This might be different transcripts of teh same gene. 
We can merge these tracvripts to a single loci.** 
However the number of genes will be reduced to less than 20 genes,making the vizualization meanlingles. Buit please try first and let's discuss it later.


