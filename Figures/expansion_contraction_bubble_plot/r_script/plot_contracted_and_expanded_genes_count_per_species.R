# Load libraries

library(ggplot2)


# Data


data_set = read.csv("data_count_exp_con_summary.csv", sep = ",", h = T)

names(data_set)

# Plot

data_set_reordered = data_set                              # Replicate data

data_set_reordered$species = factor(data_set_reordered$species,      # Reordering event factor levels
                                  levels = c("CGAR", "CMAC", "CBAT", "CMAG", "CFUS", "BYAR", "TFUL", "HWYC",
                                             "PDJA", "PGIG", "PHYP", "SMER", "IPUN", "AMEL" ))



exp_plot = ggplot(data_set_reordered, aes(x = species, y = exp_num)) + 
  geom_point(data=data_set_reordered,aes(x = species, y = exp_num, size = `exp_num`), alpha=.7) +
  scale_size(range = c(5, 44), name="Expanded genes") +
  theme_bw(base_size = 36)+
  coord_flip()


exp_plot


con_plot = ggplot(data_set_reordered, aes(x = species, y = con_num)) + 
  geom_point(data=data_set_reordered,aes(x = species, y = con_num, size = `con_num`), alpha=.7) +
  scale_size(range = c(5, 44), name="Contracted genes") +
  theme_bw(base_size = 36)+
  coord_flip()

con_plot

