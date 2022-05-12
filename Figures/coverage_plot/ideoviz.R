## PackageS

library(IdeoViz)
library(RColorBrewer)



## Data

hiccov = read.csv("hic_cov.csv", h = T, sep = ",")
ilmcov = read.csv("ilm_cov.csv", h = T, sep = ",")
ontcov = read.csv("ont_cov.csv", h = T, sep = ",")
hificov = read.csv("hifi_cov.csv", h = T, sep = ",")
telocov = read.csv("telo_cov.csv", h = T, sep = ",")
ideoacf = read.csv("ideoacf.csv", h = T, sep = ",")


## Check the header names

names(hiccov)
names(ilmcov)
names(ontcov)
names(hificov)
names(telocov)
names(ideoacf)


## Make GRanges-class GenomicRanges object for each separately


data_hic = GRanges(hiccov$chr, IRanges(start = hiccov$start, end = hiccov$end) )
mcols(data_hic)$group1 = hiccov$covhic

data_ilm = GRanges(ilmcov$chr, IRanges(start = ilmcov$start, end = ilmcov$end) )
mcols(data_ilm)$group1 = ilmcov$covilm

data_ont = GRanges(ontcov$chr, IRanges(start = ontcov$start, end = ontcov$end) )
mcols(data_ont)$group1 = ontcov$ontcov

data_hifi = GRanges(hificov$chr, IRanges(start = hificov$start, end = hificov$end) )
mcols(data_hifi)$group1 = hificov$covhifi

data_telo = GRanges(telocov$chr, IRanges(start = telocov$stat, end = telocov$end) )
mcols(data_telo)$group1 = telocov$covtelo


## Check the genomic data range object


head(data_hic)
head(data_ilm)
head(data_ont)
head(data_hic)
head(data_hic)
head(ideoacf)


## Plot for Hi-C

plotOnIdeo(chrom=seqlevels(data_hic), 
           ideo=ideoacf,
           values_GR=data_hic, 
           value_cols=colnames(mcols(data_hic)),
           plotType='lines', # plot as lines
           col='yellow', 
           #vertical=T,
           #val_range=c(0,800), 
           ylab="hi_cov",
           addScale = F,
           plot_title="Hi-C Coverage")

## Plot for Illumina

plotOnIdeo(chrom=seqlevels(data_ilm), 
           ideo=ideoacf,
           values_GR=data_ilm, 
           value_cols=colnames(mcols(data_ilm)),
           plotType='lines', # plot as lines
           col='green', 
           #vertical=T,
           #val_range=c(0,800), 
           ylab="ilm",
           addScale = F,
           plot_title="illumina Coverage")

## Plot for ONT

plotOnIdeo(chrom=seqlevels(data_ont), 
           ideo=ideoacf,
           values_GR=data_ont, 
           value_cols=colnames(mcols(data_ont)),
           plotType='lines', # plot as lines
           col='blue', 
           #vertical=T,
           #val_range=c(0,800), 
           ylab="ilm",
           addScale = F,
           plot_title="ONT Coverage")


## Plot for PacBio Hifi

plotOnIdeo(chrom=seqlevels(data_hifi), 
           ideo=ideoacf,
           values_GR=data_hifi, 
           value_cols=colnames(mcols(data_hifi)),
           plotType='lines', # plot as lines
           col='red', 
           #vertical=T,
           #val_range=c(0,800), 
           ylab="hifi",
           addScale = F,
           plot_title="Hi-Fi Coverage")





## Plot for telomeres

plotOnIdeo(chrom=seqlevels(data_telo), 
           ideo=ideoacf,
           values_GR=data_telo, 
           value_cols=colnames(mcols(data_telo)),
           plotType='lines', # plot as lines
           col='Purple', 
           #vertical=T,
           #val_range=c(0,800), 
           ylab="telo",
           addScale = F,
           plot_title="Telomeres Coverage")




## Now plot together
## Note the data row number should be same for all
## we will reshape the dataset in order to have 26563 rows as it is the lowest for PacBioHifi

## Plot data superimposed on chromosomal ideogram

data_all = GRanges(telocov$chr, IRanges(start = telocov$stat, end = telocov$end) )
mcols(data_all)$group1 = telocov$covtelo
mcols(data_all)$group2 = hiccov$covhic



Error in `[[<-`(`*tmp*`, name, value = c(7.71341, 11.7342, 11.2419, 15.0224,  : 
  26709 elements in value to replace 38412 elements



sessionInfo()

R version 4.0.2 (2020-06-22)
Platform: x86_64-w64-mingw32/x64 (64-bit)
Running under: Windows >= 8 x64 (build 9200)

Matrix products: default

locale:
[1] LC_COLLATE=English_United States.1252  LC_CTYPE=English_United States.1252    LC_MONETARY=English_United States.1252
[4] LC_NUMERIC=C                           LC_TIME=English_United States.1252    
system code page: 949

attached base packages:
[1] parallel  stats4    stats     graphics  grDevices utils     datasets  methods   base     

other attached packages:
[1] IdeoViz_1.24.0       rtracklayer_1.48.0   RColorBrewer_1.1-2   Biobase_2.48.0       GenomicRanges_1.40.0 GenomeInfoDb_1.24.2 
[7] IRanges_2.22.2       S4Vectors_0.26.1     BiocGenerics_0.34.0 

loaded via a namespace (and not attached):
 [1] rstudioapi_0.13             XVector_0.28.0              zlibbioc_1.34.0             GenomicAlignments_1.24.0   
 [5] BiocParallel_1.22.0         lattice_0.20-41             rlang_0.4.11                tools_4.0.2                
 [9] SummarizedExperiment_1.18.2 grid_4.0.2                  gtable_0.3.0                matrixStats_0.62.0         
[13] yaml_2.2.1                  crayon_1.5.1                Matrix_1.2-18               GenomeInfoDbData_1.2.3     
[17] bitops_1.0-7                RCurl_1.98-1.6              DelayedArray_0.14.1         compiler_4.0.2             
[21] Biostrings_2.56.0           Rsamtools_2.4.0             XML_3.99-0.9               
