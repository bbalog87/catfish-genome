## Raw summary of methods used in the T2T assembly of the African catfsih genome

Here, we document all steps to achieve chromosome-level telomere-to-telomrere T2T assembly, from the input data to the final phased, gap filled and polished asemblies.

#### 1) Summary of generated sequencing data
Tissues from the same single male adult animal (fish) was used to extrcat DNA for all samples.
- **HiFi reads:**
High fildelity (HiFi) reads data were produced using the circular consensus sequencing (CCS) mode of the PacBio Sequel systems. 
A total of 8,509,466 CCS reads with an avearge N50 reads length of ~16 Kb were yielded, achieving an overall genome coverage of 118x. HiFi reads have an average base-level accuracy of >99.6% (Q25). These data were mainly used to compute the primary assemblies.
- **ONT reads:** Oxford Nanopre Technologies (ONT) long reads were additionally produced on a PromethION 2 system. A total of 4,067,755
ONT reads wih N50 of 32 Kb and mean quality of >90% (Q10). ONT reads yielded an average genome coverage of 80x.
