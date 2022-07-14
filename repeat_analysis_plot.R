## Plot bar plots

## Package

library(ggplot2)

## data

data_rep = read.csv("data_repeats.csv", h =T, sep = ",")


## Plot reverse bar plot by reordering following WGD > TD > PD > TRD > DSD

data_rep_reordered = data_rep                              # Replicate data

data_rep_reordered$Event = factor(data_rep_reordered$Event,      # Reordering event factor levels
                         levels = c("WGD", "TD", "PD-pairs", "TRD-pairs", "DSD-pairs"))
data_rep_reordered$Species = factor(data_rep_reordered$Species, # Reordering Species factor levels to match the tree
                                    levels = c("Clarias gariepinus", "Silurus meridionalis", "Tachysurus fulvidraco", 
                                               "Hemibagrus wyckioides", "Ameiurus melas", "Ictalurus punctatus",
                                               "Pangasius djambal", "Pangasianodon hypophthalmus", "Pangasianodon gigas")) 

p = ggplot(data_rep_reordered, aes(x=Species, y=Value))+
  geom_bar(stat="identity")+
  facet_wrap(~Event, scales = "free",  ncol = 5)+
  coord_flip()+
  theme_light()


p





## Plot the phylogenetic tree


## library


## install BioManager

install.packages("BiocManager", dependensies = TRUE)
library(BiocManager)



## Install treedataverse

BiocManager::install("YuLab-SMU/treedataverse")



library(ggtree)


## tree data






