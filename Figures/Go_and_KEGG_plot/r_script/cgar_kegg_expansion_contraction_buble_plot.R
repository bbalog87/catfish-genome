## library

library(ggplot2)
library(patchwork)


## data importation


kegg_cgar = read.csv("t10_kegg_expansion_cgar.csv", sep = ",", h = T)

go_cgar = read.csv("t10_go_expansion_cgar.csv", sep = ",", h = T)


kegg_cla = read.csv("t10_clarias_kegg.csv", sep = ",", h = T)

go_cla = read.csv("t10_clarias_go.csv", sep = ",", h = T)



## plot


cgar_k = ggplot(kegg_cgar, aes(x = reorder(term, gene_number), y = enrich_ratio, color = `p_value_adjusted` )) + 
  geom_point(data=kegg_cgar,aes(x = reorder(term, gene_number), y = enrich_ratio, size = `gene_number`), alpha=.7)+
  scale_size(range = c(.1, 24), name="Gene number") +
  coord_flip()+
  theme_bw(base_size = 36)+
  theme(axis.ticks.length=unit(-0.1, "cm"),
        axis.text.x = element_text(margin=margin(5,5,0,5,"pt")),
        axis.text.y = element_text(margin=margin(5,5,5,5,"pt")),
        axis.text = element_text(color = "black"),
        panel.grid.minor = element_blank(),
        legend.title.align=0.5)+
  xlab("Term")+
  ylab("Enrich ratio")+
  labs(color="Corrected p-value", size="Gene number")+ #Replace by your variable names; \n allow a new line for text
  scale_color_gradient(low="#C0392B",high="#C39BD3",limits=c(0, NA)) +
  guides(colour = guide_colourbar(order = 1),
         size = guide_legend(order=2))

cgar_k





cla_k = ggplot(kegg_cla, aes(x = reorder(term, gene_number), y = enrich_ratio, color = `p_value_adjusted` )) + 
  geom_point(data=kegg_cla,aes(x = reorder(term, gene_number), y = enrich_ratio, size = `gene_number`), alpha=.7)+
  scale_size(range = c(.1, 24), name="Gene number") +
  coord_flip()+
  theme_bw(base_size = 36)+
  theme(axis.ticks.length=unit(-0.1, "cm"),
        axis.text.x = element_text(margin=margin(5,5,0,5,"pt")),
        axis.text.y = element_text(margin=margin(5,5,5,5,"pt")),
        axis.text = element_text(color = "black"),
        panel.grid.minor = element_blank(),
        legend.title.align=0.5)+
  xlab("Term")+
  ylab("Enrich ratio")+
  labs(color="Corrected p-value", size="Gene number")+ #Replace by your variable names; \n allow a new line for text
  scale_color_gradient(low="#C0392B",high="#C39BD3",limits=c(0, NA)) +
  guides(colour = guide_colourbar(order = 1),
         size = guide_legend(order=2))

cla_k





## plot Go

## plot


cgar_g = ggplot(go_cgar, aes(x = reorder(term, gene_number), y = enrich_ratio, color = `p_value_adjusted` )) + 
  geom_point(data=go_cgar,aes(x = reorder(term, gene_number), y = enrich_ratio, size = `gene_number`), alpha=.7)+
  scale_size(range = c(.1, 24), name="Gene number") +
  coord_flip()+
  theme_bw(base_size = 36)+
  theme(axis.ticks.length=unit(-0.1, "cm"),
        axis.text.x = element_text(margin=margin(5,5,0,5,"pt")),
        axis.text.y = element_text(margin=margin(5,5,5,5,"pt")),
        axis.text = element_text(color = "black"),
        panel.grid.minor = element_blank(),
        legend.title.align=0.5)+
  xlab("Term")+
  ylab("Enrich ratio")+
  labs(color="Corrected p-value", size="Gene number")+ #Replace by your variable names; \n allow a new line for text
  scale_color_gradient(low="#C0392B",high="#C39BD3",limits=c(0, NA)) +
  guides(colour = guide_colourbar(order = 1),
         size = guide_legend(order=2))

cgar_g





cla_g = ggplot(go_cla, aes(x = reorder(term, gene_number), y = enrich_ratio, color = `p_value_adjusted` )) + 
  geom_point(data=go_cla,aes(x = reorder(term, gene_number), y = enrich_ratio, size = `gene_number`), alpha=.7)+
  scale_size(range = c(.1, 24), name="Gene number") +
  coord_flip()+
  theme_bw(base_size = 36)+
  theme(axis.ticks.length=unit(-0.1, "cm"),
        axis.text.x = element_text(margin=margin(5,5,0,5,"pt")),
        axis.text.y = element_text(margin=margin(5,5,5,5,"pt")),
        axis.text = element_text(color = "black"),
        panel.grid.minor = element_blank(),
        legend.title.align=0.5)+
  xlab("Term")+
  ylab("Enrich ratio")+
  labs(color="Corrected p-value", size="Gene number")+ #Replace by your variable names; \n allow a new line for text
  scale_color_gradient(low="#C0392B",high="#C39BD3",limits=c(0, NA)) +
  guides(colour = guide_colourbar(order = 1),
         size = guide_legend(order=2))

cla_g



cgar_g + cla_g 

cgar_k  + cla_k 






