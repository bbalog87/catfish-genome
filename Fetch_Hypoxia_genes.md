
# Downlaod transcript sequences 

Fish-specific Hypoxia genes are documented in [HRGFish](https://mail.nbfgr.res.in/HRGFish/index.php) database.
However only with their gene names and IDs. There is no way to downlaod the trancripts sequnces of these genes.
This script aims to fetch the protein sequences of all hypoxia responsive genes reported in HRGFish.

## Manual work
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
 In totol 3906 transcript were fetched from NCBI
 
 
 ```
 grep ">" fish.HRG.mRNA.fa | wc -l
 3806
 ```




## Download refseq transcript sequences of HRG  reported in [HRGFish](https://mail.nbfgr.res.in/HRGFish/index.php) database.



```python
 cut -f1 hypoxia_geneID.txt  > GeneID.txt ## GeneID
for ID in $(cat GeneID.txt); do
elink -db gene -id $ID  -target nuccore -name gene_nuccore_refseqrna | efetch -format fasta >> fish.HRG.mRNA.fa

done

