# African catfish genome assembly project
Pipelines, code and ressources for creating a fully haplotype-resolved T2T assembly of the African catfish (Clarias gariepinus) combining PacBio HiFi, ONT long reads and Hi-C data.


# Previous studies on catfish species



- 2021 | Asian Red-Tail Catfish | Hemibagrus wyckioides | Illumina + Nanopore + PacBio HiFi + Hi-C | [paper](https://www.frontiersin.org/articles/10.3389/fgene.2021.747684/full)

- 2021 | striped catfish | Pangasianodon hypophthalmus | Illumina + Nanopore + Hi-C | [striped catfish updated genome paper](https://www.sciencedirect.com/science/article/pii/S0888754321003049)

- 2020 | Freshwater Apex Predator Wels Catfish | Silurus glanis | 10x Genomics | [freshwater apex genome paper](https://academic.oup.com/g3journal/article/10/11/3897/6048642)

- 2019 | giant devil catfish | Bagarius yarrelli | Illumina + PacBio | [giant devil genome paper](https://academic.oup.com/gbe/article/11/8/2071/5528502)

- 2018 | Chinese Yellow Catfish | Pelteobagrus fulvidraco | Illumina + PacBio | [paper](https://www.mdpi.com/2072-6651/10/12/488/htm)

- 2018 | walking catfish | Clarias batrachus | Illumina | ALLPATHS-LG | [paper](https://bmcgenomics.biomedcentral.com/articles/10.1186/s12864-018-5355-9)

- 2018 | yellow catfish | Pelteobagrus fulvidraco | Illumina + PacBio  + Hi-C | [Yellow catfish genome paper](https://academic.oup.com/gigascience/article/7/11/giy120/5106933) 

- 2018 | striped catfish| Pangasianodon hypophthalmus | Platanus | Illumina | [Genes level comparison](https://bmcgenomics.biomedcentral.com/articles/10.1186/s12864-018-5079-x/tables/1) | [stripped catfish paper](https://bmcgenomics.biomedcentral.com/articles/10.1186/s12864-018-5079-x#Sec12) 

- 2016 | Channel catfish | Ictalurus punctatus | MASURCA | Illumina + PacBio CLR | [Summary stats](https://www.nature.com/articles/ncomms11757/tables/1) | [Catfish paper](https://www.nature.com/articles/ncomms11757)



# Polyploidy topic in teleost fish






- unknown |A Review |  [Whole-Genome Duplication in Teleost Fishes and Its Evolutionary Consequences](https://www.imls.uzh.ch/static/CMS_publications/neuhauss/literatur/pdf14/483.pdf)

- 2006 [Fish Genomes, Comparative Genomics and Vertebrate Evolution](https://www2.ibb.unesp.br/departamentos/Morfologia/material_didatico/Prof_Cesar_Martins/Mat_Biblio_BGA_genomas/Animais/10.pdf)

> Hence, teleost fishes display a high level of genomic plasticity


- 2001 [Comparative genomics provides evidence for an ancient genome duplication event in fish](https://royalsocietypublishing.org/doi/10.1098/rstb.2001.0975)
- 2006 [Fish Genomes, Comparative Genomics and Vertebrate Evolution](https://www.eurekaselect.com/article/183)


>> .....convincing evidence that all teleosts are derived from a common tetraploid fish ancestor





- 2006 [Gene Loss and Evolutionary Rates Following Whole-Genome Duplication in Teleost Fishes](https://academic.oup.com/mbe/article/23/9/1808/1014301)

> The evolutionary rate of duplicate fish genes appears to be determined by 3 forces: 1) fish proteins evolve faster than mammalian orthologs; 2) the genes kept in double after genome duplication represent the subset under strongest purifying selection; and 3) following duplication, there is an asymmetric acceleration of evolutionary rate in one of the paralogs.




- 2008 [Ancient and modern duplication events and the evolution of stearoyl-CoA desaturases in teleost fishes](https://journals.physiology.org/doi/full/10.1152/physiolgenomics.90266.2008)

Idea: We might trace the evolutionary history of stearoyl-CoA desaturase since they are involved in food dieatary supplement

- 2012 [Polyploidy in Fish and the Teleost Genome Duplication](https://link.springer.com/chapter/10.1007%2F978-3-642-31442-1_17)
- 2020 [The lasting after-effects of an ancient polyploidy on the genomes of teleosts](https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0231356)
- 2020 [Genome of Tetraploid Fish Schizothorax o’connori Provides Insights into Early Re-diploidization and High-Altitude Adaptation](https://www.cell.com/iscience/pdf/S2589-0042(20)30689-1.pdf)



> ... after the teleost-specific third round WGD (3R WGD)........




> The teleost 3R WGD, which occurred about 320 mya, played an important role in the diversification of ancient teleosts (Yang et al., 2016). Therefore, polyploid fish species
can be used to study post-WGD genome evolution and to determine the contribution of WGD to speciation and environmental adaptation (Chen et al., 2019). Re-diploidization is an essential post-WGD evolutionary process, which differentiates and stabilizes duplicated genomes (Lien et al., 2016).


- 2016 [The channel catfish genome sequence provides insights into the evolution of scale formation in teleosts](https://www.nature.com/articles/ncomms11757)

> The channel catfish haploid genome contains 29 chromosomes with an estimated 1.0 Gb of DNA [13](https://scholar.google.com/scholar_lookup?title=Comparative%20karyology%20of%20three%20species%20of%20north%20American%20catfishes%20%28siluriformes%3A%20Ictaluridae%3A%20Ictalurus%29%20and%20four%20of%20their%20hybrid%20combinations&journal=Copeia&volume=1984&pages=873-878&publication_year=1984&author=LeGrande%2CW&author=Dunham%2CRA&author=Smitherman%2CRO),[14](https://academic.oup.com/jhered/article-abstract/84/2/122/819425) (Supplementary Fig. 1), and this diploid species is assumed to have undergone the teleost-specific genome duplication (TSGD) [15](https://www.nature.com/articles/nature05846),[16](https://onlinelibrary.wiley.com/doi/abs/10.1002/bies.20293)


- [Fish evolutionary genomics](http://igfl.ens-lyon.fr/equipes/j.-n.-volff-fish-evolutionary-genomics)

> Tetraploydization/Rediploidization  | Sex Determination | TE evolution 



- 2022 | [A high-resolution comparative atlas across 74 fish genomes illuminates teleost evolution after whole-genome duplication](https://www.biorxiv.org/content/10.1101/2022.01.13.476171v1.full.pdf)



>> All teleost fish species descend from an ancient round of whole genome duplication (WGD), 
dated 320 Mya (Jaillon et al. 2004). This dramatic evolutionary event, referred to as the teleost specific genome duplication (TGD), doubled all chromosomes and genes present in the teleost ancestor. The TGD has left a significant imprint on extant teleost genomes: while most duplicated genes have returned to a single-copy state, an important fraction of teleost genes remain in two copies, called ohnologs. 


>> Importantly, the redundancy in fish genomes can be appreciated at the macrosyntenic level,  where remnants of ancestrally duplicated chromosomes form runs of large duplicated regions (Postlethwait et al. 2000; Taylor et al. 2003; Jaillon et al. 2004)


>> In particular, autopolyploidization and allopolyploidization differentially shape the rediploidization process, i.e. how the polyploid  genome returns to a largely diploid state over time.


>> The retention of redundant gene copies is also affected by the nature of the polyploidization event


Personal comment  > we might have also rentention of duplicated genes in the african catfish that is why the busco duplicated orthologs rate is still high


For the comparative phylogenomics we might need to use [SCORPIOs](https://academic.oup.com/mbe/article/37/11/3324/5859632) pipeline due to the duplication of gene in teleost that can biased the tree inference.
