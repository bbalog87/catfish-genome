
# Downlaod proteins sequences 

Fish-specific Hypoxia genes are documented in [HRGFish](https://mail.nbfgr.res.in/HRGFish/index.php) database.
However only with their gene anme and GeneId. There is no ways to dowlod the trancript of protein sequence of these genes.
This script aims to fetch the protein sequences of all hypoxia responsive genes reported in HRGFish.

## Manual work
Unfortunatly, even geneID can now be downlaod by single click. Information of each gene need to be exported manually to a TSV file.
There are around 50 reported HRG in fish (Lsst accessed: 10.05.2022).

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

source activate ncbidownload_env
conda install ncbi-genome-download #tool 1
conda install -c bioconda ncbi-acc-download # tool2
conda install -c bioconda entrez-direct # tool3

```



## Download refseq plant mitogenome data from ncbi

We fetched from https://www.ncbi.nlm.nih.gov/genome/browse#!/organelles/, plant mitogenome, and use that list of accesion to download the data


```python

cd /agribio/HOME/yedomon1/analyses/sma/mitogenome
source activate ncbidownload_env
epost -input refseq.list -db nucleotide | efetch -format fasta > plant.mito.refseq.fasta 
source deactivate ncbidownload_env
