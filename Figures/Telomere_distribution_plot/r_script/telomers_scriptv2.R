## load libraries


library(ggplot2)
library(dplyr)
library(scales)
library(patchwork)

## Load data

data_telo = read.table("telo_cov.txt", h  = T, sep = ",")


## Plot

chr1 = ggplot(filter(data_telo, chr == "Chr1"), aes(x=end*0.000001, y=covtelo)) +
  geom_line()+
  scale_x_continuous(labels = comma_format(big.mark = ",", decimal.mark = "."))+
  scale_y_continuous(labels = comma_format(big.mark = ",", decimal.mark = "."))+
  labs(title = "Chr1", x = "Genomic region (Mbp)", y = "(TTAGGG)n copy number \n per 25Kbp window") +
  theme_bw(base_size = 48)

chr1  



chr2 = ggplot(filter(data_telo, chr == "Chr2"), aes(x=end*0.000001, y=covtelo)) +
  geom_line()+
  scale_x_continuous(labels = comma_format(big.mark = ",", decimal.mark = "."))+
  scale_y_continuous(labels = comma_format(big.mark = ",", decimal.mark = "."))+
  labs(title = "Chr2", x = "Genomic region (Mbp)", y = "(TTAGGG)n copy number \n per 25Kbp window") +
  theme_bw(base_size = 48)

chr2 


chr3 = ggplot(filter(data_telo, chr == "Chr3"), aes(x=end*0.000001, y=covtelo)) +
  geom_line()+
  scale_x_continuous(labels = comma_format(big.mark = ",", decimal.mark = "."))+
  scale_y_continuous(labels = comma_format(big.mark = ",", decimal.mark = "."))+
  labs(title = "Chr3", x = "Genomic region (Mbp)", y = "(TTAGGG)n copy number \n per 25Kbp window") +
  theme_bw(base_size = 48)

chr3 



chr4 = ggplot(filter(data_telo, chr == "Chr4"), aes(x=end*0.000001, y=covtelo)) +
  geom_line()+
  scale_x_continuous(labels = comma_format(big.mark = ",", decimal.mark = "."))+
  scale_y_continuous(labels = comma_format(big.mark = ",", decimal.mark = "."))+
  labs(title = "Chr4", x = "Genomic region (Mbp)", y = "(TTAGGG)n copy number \n per 25Kbp window") +
  theme_bw(base_size = 48)

chr4 



chr5 = ggplot(filter(data_telo, chr == "Chr5"), aes(x=end*0.000001, y=covtelo)) +
  geom_line()+
  scale_x_continuous(labels = comma_format(big.mark = ",", decimal.mark = "."))+
  scale_y_continuous(labels = comma_format(big.mark = ",", decimal.mark = "."))+
  labs(title = "Chr5", x = "Genomic region (Mbp)", y = "(TTAGGG)n copy number \n per 25Kbp window") +
  theme_bw(base_size = 48)

chr5 

chr6 = ggplot(filter(data_telo, chr == "Chr6"), aes(x=end*0.000001, y=covtelo)) +
  geom_line()+
  scale_x_continuous(labels = comma_format(big.mark = ",", decimal.mark = "."))+
  scale_y_continuous(labels = comma_format(big.mark = ",", decimal.mark = "."))+
  labs(title = "Chr6", x = "Genomic region (Mbp)", y = "(TTAGGG)n copy number \n per 25Kbp window") +
  theme_bw(base_size = 48)

chr6 


chr7 = ggplot(filter(data_telo, chr == "Chr7"), aes(x=end*0.000001, y=covtelo)) +
  geom_line()+
  scale_x_continuous(labels = comma_format(big.mark = ",", decimal.mark = "."))+
  scale_y_continuous(labels = comma_format(big.mark = ",", decimal.mark = "."))+
  labs(title = "Chr7", x = "Genomic region (Mbp)", y = "(TTAGGG)n copy number \n per 25Kbp window") +
  theme_bw(base_size = 48)

chr7 


chr8 = ggplot(filter(data_telo, chr == "Chr8"), aes(x=end*0.000001, y=covtelo)) +
  geom_line()+
  scale_x_continuous(labels = comma_format(big.mark = ",", decimal.mark = "."))+
  scale_y_continuous(labels = comma_format(big.mark = ",", decimal.mark = "."))+
  labs(title = "Chr8", x = "Genomic region (Mbp)", y = "(TTAGGG)n copy number \n per 25Kbp window") +
  theme_bw(base_size = 48)

chr8 



chr9 = ggplot(filter(data_telo, chr == "Chr9"), aes(x=end*0.000001, y=covtelo)) +
  geom_line()+
  scale_x_continuous(labels = comma_format(big.mark = ",", decimal.mark = "."))+
  scale_y_continuous(labels = comma_format(big.mark = ",", decimal.mark = "."))+
  labs(title = "Chr9", x = "Genomic region (Mbp)", y = "(TTAGGG)n copy number \n per 25Kbp window") +
  theme_bw(base_size = 48)

chr9 



chr10 = ggplot(filter(data_telo, chr == "Chr10"), aes(x=end*0.000001, y=covtelo)) +
  geom_line()+
  scale_x_continuous(labels = comma_format(big.mark = ",", decimal.mark = "."))+
  scale_y_continuous(labels = comma_format(big.mark = ",", decimal.mark = "."))+
  labs(title = "Chr10", x = "Genomic region (Mbp)", y = "(TTAGGG)n copy number \n per 25Kbp window") +
  theme_bw(base_size = 48)

chr10 



chr11 = ggplot(filter(data_telo, chr == "Chr11"), aes(x=end*0.000001, y=covtelo)) +
  geom_line()+
  scale_x_continuous(labels = comma_format(big.mark = ",", decimal.mark = "."))+
  scale_y_continuous(labels = comma_format(big.mark = ",", decimal.mark = "."))+
  labs(title = "Chr11", x = "Genomic region (Mbp)", y = "(TTAGGG)n copy number \n per 25Kbp window") +
  theme_bw(base_size = 48)

chr11 

chr12 = ggplot(filter(data_telo, chr == "Chr12"), aes(x=end*0.000001, y=covtelo)) +
  geom_line()+
  scale_x_continuous(labels = comma_format(big.mark = ",", decimal.mark = "."))+
  scale_y_continuous(labels = comma_format(big.mark = ",", decimal.mark = "."))+
  labs(title = "Chr12", x = "Genomic region (Mbp)", y = "(TTAGGG)n copy number \n per 25Kbp window") +
  theme_bw(base_size = 48)

chr12 


chr13 = ggplot(filter(data_telo, chr == "Chr13"), aes(x=end*0.000001, y=covtelo)) +
  geom_line()+
  scale_x_continuous(labels = comma_format(big.mark = ",", decimal.mark = "."))+
  scale_y_continuous(labels = comma_format(big.mark = ",", decimal.mark = "."))+
  labs(title = "Chr13", x = "Genomic region (Mbp)", y = "(TTAGGG)n copy number \n per 25Kbp window") +
  theme_bw(base_size = 48)

chr13 


chr14 = ggplot(filter(data_telo, chr == "Chr14"), aes(x=end*0.000001, y=covtelo)) +
  geom_line()+
  scale_x_continuous(labels = comma_format(big.mark = ",", decimal.mark = "."))+
  scale_y_continuous(labels = comma_format(big.mark = ",", decimal.mark = "."))+
  labs(title = "Chr14", x = "Genomic region (Mbp)", y = "(TTAGGG)n copy number \n per 25Kbp window") +
  theme_bw(base_size = 48)

chr14 



chr15 = ggplot(filter(data_telo, chr == "Chr15"), aes(x=end*0.000001, y=covtelo)) +
  geom_line()+
  scale_x_continuous(labels = comma_format(big.mark = ",", decimal.mark = "."))+
  scale_y_continuous(labels = comma_format(big.mark = ",", decimal.mark = "."))+
  labs(title = "Chr15", x = "Genomic region (Mbp)", y = "(TTAGGG)n copy number \n per 25Kbp window") +
  theme_bw(base_size = 48)

chr15


chr16 = ggplot(filter(data_telo, chr == "Chr16"), aes(x=end*0.000001, y=covtelo)) +
  geom_line()+
  scale_x_continuous(labels = comma_format(big.mark = ",", decimal.mark = "."))+
  scale_y_continuous(labels = comma_format(big.mark = ",", decimal.mark = "."))+
  labs(title = "Chr16", x = "Genomic region (Mbp)", y = "(TTAGGG)n copy number \n per 25Kbp window") +
  theme_bw(base_size = 48)

chr16


chr17 = ggplot(filter(data_telo, chr == "Chr17"), aes(x=end*0.000001, y=covtelo)) +
  geom_line()+
  scale_x_continuous(labels = comma_format(big.mark = ",", decimal.mark = "."))+
  scale_y_continuous(labels = comma_format(big.mark = ",", decimal.mark = "."))+
  labs(title = "Chr17", x = "Genomic region (Mbp)", y = "(TTAGGG)n copy number \n per 25Kbp window") +
  theme_bw(base_size = 48)

chr17



chr18 = ggplot(filter(data_telo, chr == "Chr18"), aes(x=end*0.000001, y=covtelo)) +
  geom_line()+
  scale_x_continuous(labels = comma_format(big.mark = ",", decimal.mark = "."))+
  scale_y_continuous(labels = comma_format(big.mark = ",", decimal.mark = "."))+
  labs(title = "Chr18", x = "Genomic region (Mbp)", y = "(TTAGGG)n copy number \n per 25Kbp window") +
  theme_bw(base_size = 48)

chr18 



chr19 = ggplot(filter(data_telo, chr == "Chr19"), aes(x=end*0.000001, y=covtelo)) +
  geom_line()+
  scale_x_continuous(labels = comma_format(big.mark = ",", decimal.mark = "."))+
  scale_y_continuous(labels = comma_format(big.mark = ",", decimal.mark = "."))+
  labs(title = "Chr19", x = "Genomic region (Mbp)", y = "(TTAGGG)n copy number \n per 25Kbp window") +
  theme_bw(base_size = 48)

chr19



chr20 = ggplot(filter(data_telo, chr == "Chr20"), aes(x=end*0.000001, y=covtelo)) +
  geom_line()+
  scale_x_continuous(labels = comma_format(big.mark = ",", decimal.mark = "."))+
  scale_y_continuous(labels = comma_format(big.mark = ",", decimal.mark = "."))+
  labs(title = "Chr20", x = "Genomic region (Mbp)", y = "(TTAGGG)n copy number \n per 25Kbp window") +
  theme_bw(base_size = 48)

chr20


chr21 = ggplot(filter(data_telo, chr == "Chr21"), aes(x=end*0.000001, y=covtelo)) +
  geom_line()+
  scale_x_continuous(labels = comma_format(big.mark = ",", decimal.mark = "."))+
  scale_y_continuous(labels = comma_format(big.mark = ",", decimal.mark = "."))+
  labs(title = "Chr21", x = "Genomic region (Mbp)", y = "(TTAGGG)n copy number \n per 25Kbp window") +
  theme_bw(base_size = 48)

chr21


chr22 = ggplot(filter(data_telo, chr == "Chr22"), aes(x=end*0.000001, y=covtelo)) +
  geom_line()+
  scale_x_continuous(labels = comma_format(big.mark = ",", decimal.mark = "."))+
  scale_y_continuous(labels = comma_format(big.mark = ",", decimal.mark = "."))+
  labs(title = "Chr22", x = "Genomic region (Mbp)", y = "(TTAGGG)n copy number \n per 25Kbp window") +
  theme_bw(base_size = 48)

chr22

chr23 = ggplot(filter(data_telo, chr == "Chr23"), aes(x=end*0.000001, y=covtelo)) +
  geom_line()+
  scale_x_continuous(labels = comma_format(big.mark = ",", decimal.mark = "."))+
  scale_y_continuous(labels = comma_format(big.mark = ",", decimal.mark = "."))+
  labs(title = "Chr23", x = "Genomic region (Mbp)", y = "(TTAGGG)n copy number \n per 25Kbp window") +
  theme_bw(base_size = 48)

chr23



chr24 = ggplot(filter(data_telo, chr == "Chr24"), aes(x=end*0.000001, y=covtelo)) +
  geom_line()+
  scale_x_continuous(labels = comma_format(big.mark = ",", decimal.mark = "."))+
  scale_y_continuous(labels = comma_format(big.mark = ",", decimal.mark = "."))+
  labs(title = "Chr24", x = "Genomic region (Mbp)", y = "(TTAGGG)n copy number \n per 25Kbp window") +
  theme_bw(base_size = 48)

chr24


chr25 = ggplot(filter(data_telo, chr == "Chr25"), aes(x=end*0.000001, y=covtelo)) +
  geom_line()+
  scale_x_continuous(labels = comma_format(big.mark = ",", decimal.mark = "."))+
  scale_y_continuous(labels = comma_format(big.mark = ",", decimal.mark = "."))+
  labs(title = "Chr25", x = "Genomic region (Mbp)", y = "(TTAGGG)n copy number \n per 25Kbp window") +
  theme_bw(base_size = 48)

chr25



chr26 = ggplot(filter(data_telo, chr == "Chr26"), aes(x=end*0.000001, y=covtelo)) +
  geom_line()+
  scale_x_continuous(labels = comma_format(big.mark = ",", decimal.mark = "."))+
  scale_y_continuous(labels = comma_format(big.mark = ",", decimal.mark = "."))+
  labs(title = "Chr26", x = "Genomic region (Mbp)", y = "(TTAGGG)n copy number \n per 25Kbp window") +
  theme_bw(base_size = 48)

chr26


chr27 = ggplot(filter(data_telo, chr == "Chr27"), aes(x=end*0.000001, y=covtelo)) +
  geom_line()+
  scale_x_continuous(labels = comma_format(big.mark = ",", decimal.mark = "."))+
  scale_y_continuous(labels = comma_format(big.mark = ",", decimal.mark = "."))+
  labs(title = "Chr27", x = "Genomic region (Mbp)", y = "(TTAGGG)n copy number \n per 25Kbp window") +
  theme_bw(base_size = 48)

chr27



chr28 = ggplot(filter(data_telo, chr == "Chr28"), aes(x=end*0.000001, y=covtelo)) +
  geom_line()+
  scale_x_continuous(labels = comma_format(big.mark = ",", decimal.mark = "."))+
  scale_y_continuous(labels = comma_format(big.mark = ",", decimal.mark = "."))+
  labs(title = "Chr28", x = "Genomic region (Mbp)", y = "(TTAGGG)n copy number \n per 25Kbp window") +
  theme_bw(base_size = 48)

chr28




### plot arrangement

(chr1 | chr8 | chr15 | chr22) /
  (chr2 | chr9 | chr16 | chr23 ) /
  (chr3 | chr10 | chr17 | chr24 ) /
  (chr4 | chr11 | chr18 | chr25 ) /
  (chr5 | chr12 | chr19 | chr26 ) /
  (chr6 | chr13 | chr20 | chr27 ) /
  (chr7 | chr14 | chr21 | chr28 ) 
  
  
  