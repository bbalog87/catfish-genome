# Load libraries

library(ggplot2)
library(dplyr)


# Data


data_con_exp = read.csv("data_con_exp.csv", sep = ",", h = T)



# Get expanded and contracted gene for each species

# AMEL

data_con_exp %>% 
  filter(Pvalue<0.05) %>% 
  filter(Species=="AMEL")  %>% 
  filter(Trend=="Expansion") %>% 
  select(Change) %>% 
  sum()


data_con_exp %>% 
  filter(Pvalue<0.05) %>% 
  filter(Species=="AMEL")  %>% 
  filter(Trend=="Contraction") %>% 
  select(Change) %>% 
  sum()

# IPUN

data_con_exp %>% 
  filter(Pvalue<0.05) %>% 
  filter(Species=="IPUN")  %>% 
  filter(Trend=="Expansion") %>% 
  select(Change) %>% 
  sum()


data_con_exp %>% 
  filter(Pvalue<0.05) %>% 
  filter(Species=="IPUN")  %>% 
  filter(Trend=="Contraction") %>% 
  select(Change) %>% 
  sum()

# SMER


data_con_exp %>% 
  filter(Pvalue<0.05) %>% 
  filter(Species=="SMER")  %>% 
  filter(Trend=="Expansion") %>% 
  select(Change) %>% 
  sum()


data_con_exp %>% 
  filter(Pvalue<0.05) %>% 
  filter(Species=="SMER")  %>% 
  filter(Trend=="Contraction") %>% 
  select(Change) %>% 
  sum()

# PHYP


data_con_exp %>% 
  filter(Pvalue<0.05) %>% 
  filter(Species=="PHYP")  %>% 
  filter(Trend=="Expansion") %>% 
  select(Change) %>% 
  sum()


data_con_exp %>% 
  filter(Pvalue<0.05) %>% 
  filter(Species=="PHYP")  %>% 
  filter(Trend=="Contraction") %>% 
  select(Change) %>% 
  sum()

# PGIG


data_con_exp %>% 
  filter(Pvalue<0.05) %>% 
  filter(Species=="PGIG")  %>% 
  filter(Trend=="Expansion") %>% 
  select(Change) %>% 
  sum()


data_con_exp %>% 
  filter(Pvalue<0.05) %>% 
  filter(Species=="PGIG")  %>% 
  filter(Trend=="Contraction") %>% 
  select(Change) %>% 
  sum()

# PDJA


data_con_exp %>% 
  filter(Pvalue<0.05) %>% 
  filter(Species=="PDJA")  %>% 
  filter(Trend=="Expansion") %>% 
  select(Change) %>% 
  sum()


data_con_exp %>% 
  filter(Pvalue<0.05) %>% 
  filter(Species=="PDJA")  %>% 
  filter(Trend=="Contraction") %>% 
  select(Change) %>% 
  sum()

# HWYC

data_con_exp %>% 
  filter(Pvalue<0.05) %>% 
  filter(Species=="HWYC")  %>% 
  filter(Trend=="Expansion") %>% 
  select(Change) %>% 
  sum()


data_con_exp %>% 
  filter(Pvalue<0.05) %>% 
  filter(Species=="HWYC")  %>% 
  filter(Trend=="Contraction") %>% 
  select(Change) %>% 
  sum()

# TFUL


data_con_exp %>% 
  filter(Pvalue<0.05) %>% 
  filter(Species=="TFUL")  %>% 
  filter(Trend=="Expansion") %>% 
  select(Change) %>% 
  sum()


data_con_exp %>% 
  filter(Pvalue<0.05) %>% 
  filter(Species=="TFUL")  %>% 
  filter(Trend=="Contraction") %>% 
  select(Change) %>% 
  sum()

# BYAR


data_con_exp %>% 
  filter(Pvalue<0.05) %>% 
  filter(Species=="BYAR")  %>% 
  filter(Trend=="Expansion") %>% 
  select(Change) %>% 
  sum()


data_con_exp %>% 
  filter(Pvalue<0.05) %>% 
  filter(Species=="BYAR")  %>% 
  filter(Trend=="Contraction") %>% 
  select(Change) %>% 
  sum()

# CFUS


data_con_exp %>% 
  filter(Pvalue<0.05) %>% 
  filter(Species=="CFUS")  %>% 
  filter(Trend=="Expansion") %>% 
  select(Change) %>% 
  sum()


data_con_exp %>% 
  filter(Pvalue<0.05) %>% 
  filter(Species=="CFUS")  %>% 
  filter(Trend=="Contraction") %>% 
  select(Change) %>% 
  sum()

# CMAG


data_con_exp %>% 
  filter(Pvalue<0.05) %>% 
  filter(Species=="CMAG")  %>% 
  filter(Trend=="Expansion") %>% 
  select(Change) %>% 
  sum()


data_con_exp %>% 
  filter(Pvalue<0.05) %>% 
  filter(Species=="CMAG")  %>% 
  filter(Trend=="Contraction") %>% 
  select(Change) %>% 
  sum()

# CBAT


data_con_exp %>% 
  filter(Pvalue<0.05) %>% 
  filter(Species=="CBAT")  %>% 
  filter(Trend=="Expansion") %>% 
  select(Change) %>% 
  sum()


data_con_exp %>% 
  filter(Pvalue<0.05) %>% 
  filter(Species=="CBAT")  %>% 
  filter(Trend=="Contraction") %>% 
  select(Change) %>% 
  sum()

# CMAT


data_con_exp %>% 
  filter(Pvalue<0.05) %>% 
  filter(Species=="CMAC")  %>% 
  filter(Trend=="Expansion") %>% 
  select(Change) %>% 
  sum()


data_con_exp %>% 
  filter(Pvalue<0.05) %>% 
  filter(Species=="CMAC")  %>% 
  filter(Trend=="Contraction") %>% 
  select(Change) %>% 
  sum()

# CGAR


data_con_exp %>% 
  filter(Pvalue<0.05) %>% 
  filter(Species=="CGAR")  %>% 
  filter(Trend=="Expansion") %>% 
  select(Change) %>% 
  sum()


data_con_exp %>% 
  filter(Pvalue<0.05) %>% 
  filter(Species=="CGAR")  %>% 
  filter(Trend=="Contraction") %>% 
  select(Change) %>% 
  sum()
