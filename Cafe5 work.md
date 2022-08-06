
# Process Cafe5 output to extract genes families in expansion and contraction on ecah branch

The changes in each gene family and for each axa are recorde in the file named _Base_change.tab_. 
the fisrt column is the represnt familyIds. FRom column 2 on, the braches inclusding taxa. A posituve (>0) counts for a taxon X 
means this gene family is exapnding for taxon X. A negative count means contracting geen family.

All data are availebl unde this [LINK](https://unibox.uni-rostock.de/getlink/fiV6HqPPCCR3nEj2pHo9JvZa/)

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


## Process data  with R

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

