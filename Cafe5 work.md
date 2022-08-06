
# Process Cafe5 output to extract genes families in expansion and contraction on ecah branch

The changes in each gene xfamily and for each axa are recorde in the file named _Base_change.tab_. 
the fisrt column is the represnt familyIds. FRom column 2 on, the braches inclusding taxa. A posituve (>0) counts for a taxon X 
means this gene family is exapnding for taxon X. A negative count means contracting geen family.

## Exact genes family in expansion or contracvtion in each branch 

```bash


## get column names 
#HEADER= $(head -1 Base_change.tab) ## get columnID (Number) conatinaing Species
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
Unfortunately, this script is not working properly. So did the extarction manullay for each taxon

```python

# for getting expansions for the taxon or node that appears in the N-th column Base_change.tab file:
awk '$N > 0 {print $1,$N}' Base_change.tab > Expansions_taxonName.txt

#For contractions:
awk '$N < 0 {print $1,$N}' Base_change.tab > Contractions_taxonName.txt
````


## Process daat with R

```R

## process CAFE output
library(dplyr)
library(data.table)
library(stringr)


temp = list.files(pattern="*.txt")

allFiles.list <- lapply(temp, read.table, sep = "", header=TRUE)
#myfiles = lapply(temp, read.delim)

processCafe<-function(LIST){
  lis=list()
  for (i in 1:length(LIST)) {
    df<-LIST[[i]]
    
    df$Species<-rep(substr(colnames(df)[2], start = 1, stop = 4),
                    nrow(df))
    colnames(df)<-c("FamilyID", "Change", "Species")
    lis[[i]]<-df
    
  }
  res=lis
return(res)
  
}

OGlist<-processCafe(allFiles.list)

df.OG <- do.call("rbind", OGlist)
df.OG$Trend<-NA

## Add changes trend
df.OG<-df.OG %>% mutate(Trend=ifelse((Change>0),
                                     "Expansion", "Contraction"))
## Reads significance table
Base_family_Sig <- read.delim("Base_family_Sig.txt")

## add significance and pvlues
df.OG.Sig<-merge(df.OG,Base_family_Sig, by="FamilyID")

## Write out file
write.csv(df.OG.Sig, "catfish.OG.Sig.txt", row.names = F)

## Extract significant OGs in expansion in CGAR
df.CGAR.Exp<-df.OG.Sig %>% 
  filter(Significance=="y" & Species=="CGAR" & Trend=="Expansion")

### extract OG in contraction in CGAR
df.CGAR.Con<-df.OG.Sig %>% 
  filter(Significance=="y" & Species=="CGAR" & Trend=="Contraction")

## Write out file
write.csv(df.CGAR.Exp, "CGAR.OG.Exp.txt", row.names = F)
write.csv(df.CGAR.Con, "CGAR.OG.Con.txt", row.names = F)




ClaristList<-c("CGAR", "CFUS","CMAC", "CMAG","CBAT")

## Extract significant OGs in expansion in Clarias spp.
Clarias.Exp<-df.OG.Sig %>%
  filter(Species=="CGAR" | Species=="CBAT" | Species=="CFUS" | Species=="CMAG" |Species=="CMAC") %>% 
  filter(Significance=="y" & Trend=="Expansion") 

Clarias.Exp.only<-Clarias.Exp %>% select(FamilyID) %>% table() %>%
    as.data.frame()

## Extract significant OGs in contraction in Clarias spp.
Clarias.Con<-df.OG.Sig %>%
  filter(Species=="CGAR" | Species=="CBAT" | Species=="CFUS" | Species=="CMAG" |Species=="CMAC") %>% 
  filter(Significance=="y" & Trend=="Contraction") 

Clarias.Con.only<-Clarias.Con %>% select(FamilyID) %>% table() %>%
  as.data.frame()

## Write out file
write.csv(Clarias.Con, "Clarias.OG.Con.txt", row.names = F)
write.csv(Clarias.Exp, "Clarias.OG.Exp.txt", row.names = F)


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


