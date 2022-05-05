## Create an environment

```python

conda create --name ncbidownload_env

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

```


In summary use **epost** to list the sequences with a pipe with **efecth** to grab those sequences 

> Nota Bene:change -db nucleotide into protein when it comes to protein data set like...



```python

epost -input yoursequencesIDs_in_one_column.list -db protein | efetch -format fasta > your.protein.seq.fasta 

```
