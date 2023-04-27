library(dplyr)
library(ggplot2)

# Read in the kmer histogram data
kmer_histogram <- read.table("kmer_histogram.txt", 
                             col.names = c("kmer_multiplicity", "frequency"))


# Plot kmer histogram
histo.plot<-ggplot(kmer_histogram[19:250,], aes(x = kmer_multiplicity, y = frequency)) +
  geom_bar(stat = "identity", fill = "lightblue") +
  labs(title = "21-mers histogram", x = "kmer_multiplicity", y = "") +
  theme_minimal() +
  theme(plot.title = element_text(size = 20, face = "bold", hjust = 0.5),
        axis.title = element_text(size = 20),
        axis.text = element_text(size = 16),
        legend.text = element_text(size = 16),
        legend.title = element_blank(),
        text = element_text(size = 20, family = "sans")) +
  scale_y_continuous(labels = function(x) format(x/1000000, 
                    scientific = FALSE, big.mark = " ", decimal.mark = "x 10^")) +
  ylab(expression(paste("Frequency (", "x", 10^6, ")", sep = "")))
# view the plot
histo.plot



# Constants from k-mers histogram and jellyfish stats
mid_index <- 100
high_index <- 185
kmer_length <- 21
total_num_bases <- 132796377525 # Total bases obtained from HiFi reads
total_kmers_size <- 132626191845 # Total size spanned by k-mers
num_distinct_kmers <- 4150614052 # distinct k-mers count

# Erroneous k-mers lowest turning point
error_turning_point <- which.min(kmer_histogram$frequency[1:50])

# Heterozygous k-mers peak
het_peak_depth <- kmer_histogram %>%
  filter(kmer_multiplicity >= error_turning_point & kmer_multiplicity <= mid_index) %>%
  arrange(desc(frequency)) %>%
  slice(1) %>%
  pull(kmer_multiplicity)

# Homozygous k-mers peak
hom_peak_depth <- kmer_histogram %>%
  filter(kmer_multiplicity >= mid_index & kmer_multiplicity <= high_index) %>%
  arrange(desc(frequency)) %>%
  slice(1) %>%
  pull(kmer_multiplicity)

# Function to estimate genome coverage
estimate_genome_coverage <- function(kmer_length, kmer_frequency, genome_size) {
  coverage_sum <- sum(kmer_length * kmer_frequency)
  genome_coverage <- coverage_sum / genome_size
  return(genome_coverage)
}

# Estimate genome coverage
est_genome_coverage <- estimate_genome_coverage(kmer_length = kmer_length,
                                                kmer_frequency = kmer_histogram$frequency,
                                                genome_size = 980546286.52)

# Total observed and trusted k-mers
total_trusted_kmers <- kmer_histogram %>%
  filter(kmer_multiplicity >= error_turning_point) %>%
  summarise(sum(frequency)) %>%
  pull()

# Heterozygosity rate
# Heterozygosity rate = (Number of distinct k-mers / Total number of k-mers) / 2
# Each heterozygous site in a diploid genome ideally generates 2 distinct kmers
# The total number of het. sites = number of distinct k-mers / 2

num_het_sites <- num_distinct_kmers / 2
het_rate <- num_het_sites / total_kmers_size  # ==> 0.01564779
# Altrernativley, can we can divide num_het_sites by the total
# number of bases spanned by all reads
het_rate2 <- num_het_sites / total_num_bases  # ==> 0.01562774

# Print heterozygosity rate
cat("Heterozygosity rate:", het_rate, "\n")

# Estimate genome size (bp)
est_genome_size <- kmer_histogram %>%
  filter(kmer_multiplicity >= 19 & kmer_multiplicity <= nrow(kmer_histogram)) %>%
  summarise(area_under_curve = sum(kmer_multiplicity * frequency)) %>%
  pull() / hom_peak_depth

# Expected single copy size
single_copy_size <- kmer_histogram %>%
  filter(kmer_multiplicity > error_turning_point & kmer_multiplicity <= high_index) %>%
  summarise(area_single_copy = sum(kmer_multiplicity * frequency)) %>%
  pull() / hom_peak_depth


# Print the results
cat(paste(
  sprintf("%-35s %s\n", "Total number of bases (bp):", total_num_bases),
  sprintf("%-35s %s\n", "Total number of trusted k-mers:", total_trusted_kmers),
  sprintf("%-35s %s\n", "Heterozygous peak (depth):", het_peak_depth),
  sprintf("%-35s %s\n", "Homozygous peak (depth):", hom_peak_depth),
  sprintf("%-35s %s\n", "Estimated genome coverage:", est_genome_coverage),
  sprintf("%-35s %s\n", "Obs. heterozygosity rate (%):", het_rate*100),
  sprintf("%-35s %s\n", "Estimated genome size (bp):", est_genome_size),
  sprintf("%-35s %s\n", "Expected single-copy size (bp):", single_copy_size),
  sep = ""
))    
