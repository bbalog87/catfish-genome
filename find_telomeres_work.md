

### Find telomeres with Jana Sperschneider [script](https://github.com/JanaSperschneider/FindTelomeres)


```python

python FindTelomeres.py 2_8.fasta

```

I got



```python

##########
28 sequences to analyze for telomeric repeats (TTAGGG/CCCTAA) in file 2_8.fasta
##########

scaffold_2       Reverse (end of sequence)       TTAGGGTTAGGGTTAGGGTTAGGGTTAGGGTTAGGGTTAGGGTTAGGGTT
scaffold_3       Forward (start of sequence)     CTAACCCTAACCTAACCCTAACCCTAACCCTAACCCTAACCCCTAACCCT
scaffold_4       Forward (start of sequence)     AACCCTGAACCTACCCTACCCCCTCACCCTACCCCTACCCAAACCCTAAC
scaffold_4       Reverse (end of sequence)       AGGGTTAGGGTTAGGGTTAGGGTTAGGGTTAGGGTTAGGGTTAGGGTTAG
scaffold_9       Reverse (end of sequence)       TTAGGGTTAGGGTTAGGGTTAGGGTTAGGGTTAGGGTTAGGGTTAGGGTT
scaffold_11      Forward (start of sequence)     TAACCCTAACCCTAACCCTAACCCTAACCCTAACCCTAACCCTAACCCTA
scaffold_13      Forward (start of sequence)     AACCCTAACCCTAACCCTAACCCTAACCCTAACCCTAACCCTAACCCTAA
scaffold_18      Forward (start of sequence)     AACCCTAACCCTAACCCTAACCCTAACCCTAACCCTAACCCCTAACCCTA
scaffold_28      Reverse (end of sequence)       GGGTTAGGGGTTAGGGTTAGGGTTAGGGTTAGGGTTAGGGTTAGGGTTAG

Telomeres found: 9 (5 forward, 4 reverse)

```


From this output, only the scaffold_4 reached a T2T level.




# Today 11th February 2022 



### Try to find out telomeres in the unscaffold sequences.

```python

seqtk subseq AB.prim.scaff_FINAL.gapfilled.fa 29_55.list > 29_55.fasta

```



### check the assembly stats


```python

stats for 29_55.fasta
sum = 10237695, n = 27, ave = 379173.89, largest = 1662060
N50 = 906850, n = 4
N60 = 713959, n = 5
N70 = 537245, n = 7
N80 = 420865, n = 9
N90 = 282270, n = 12
N100 = 3148, n = 27
N_count = 0
Gaps = 0

```



### Screen the 27 sequences for telemores search


```
python FindTelomeres.py 29_55.fasta

```


I got 



```python



##########
27 sequences to analyze for telomeric repeats (TTAGGG/CCCTAA) in file 29_55.fasta
##########

scaffold_35      Reverse (end of sequence)       GTTAGGGTAGGGTTAGGGTCTAGGGTTCAGGGTTAGGGTTAGGGTAGGGT
scaffold_37      Reverse (end of sequence)       TAGAGGGTTTAGGGTTAGGTTAGGGTTTAGGGTTAGGGTTAGTAGGGTTA
scaffold_52      Reverse (end of sequence)       TAGGGTTAGGGTTAGGGTTAGGGTTAGGGTTAGGGTTAGGGTTAGGGGTT

Telomeres found: 3 (0 forward, 3 reverse)


```


Just to check I rerun the code on the whole hic based assembly


```python

python FindTelomeres.py AB.prim.scaff_FINAL.gapfilled.fa

```



I got the expected result




```python



##########
55 sequences to analyze for telomeric repeats (TTAGGG/CCCTAA) in file AB.prim.scaff_FINAL.gapfilled.fa
##########

scaffold_2       Reverse (end of sequence)       TTAGGGTTAGGGTTAGGGTTAGGGTTAGGGTTAGGGTTAGGGTTAGGGTT
scaffold_3       Forward (start of sequence)     CTAACCCTAACCTAACCCTAACCCTAACCCTAACCCTAACCCCTAACCCT
scaffold_4       Forward (start of sequence)     AACCCTGAACCTACCCTACCCCCTCACCCTACCCCTACCCAAACCCTAAC
scaffold_4       Reverse (end of sequence)       AGGGTTAGGGTTAGGGTTAGGGTTAGGGTTAGGGTTAGGGTTAGGGTTAG
scaffold_9       Reverse (end of sequence)       TTAGGGTTAGGGTTAGGGTTAGGGTTAGGGTTAGGGTTAGGGTTAGGGTT
scaffold_11      Forward (start of sequence)     TAACCCTAACCCTAACCCTAACCCTAACCCTAACCCTAACCCTAACCCTA
scaffold_13      Forward (start of sequence)     AACCCTAACCCTAACCCTAACCCTAACCCTAACCCTAACCCTAACCCTAA
scaffold_18      Forward (start of sequence)     AACCCTAACCCTAACCCTAACCCTAACCCTAACCCTAACCCCTAACCCTA
scaffold_28      Reverse (end of sequence)       GGGTTAGGGGTTAGGGTTAGGGTTAGGGTTAGGGTTAGGGTTAGGGTTAG
scaffold_35      Reverse (end of sequence)       GTTAGGGTAGGGTTAGGGTCTAGGGTTCAGGGTTAGGGTTAGGGTAGGGT
scaffold_37      Reverse (end of sequence)       TAGAGGGTTTAGGGTTAGGTTAGGGTTTAGGGTTAGGGTTAGTAGGGTTA
scaffold_52      Reverse (end of sequence)       TAGGGTTAGGGTTAGGGTTAGGGTTAGGGTTAGGGTTAGGGTTAGGGGTT

Telomeres found: 12 (5 forward, 7 reverse)


```


### Interpretation and suggestions

- the scaffold 4 exhibits a T2T pattern
- some sequences that are supposed to belong to the unscaffolds sequences showed a partial telemore presence. Quite strange. But no T2T at least.
- even though pacbio hifi assembly only help to reach a chromosomal scale for each contig, reconstruction with Hi-c failed to capture complex regions (telomeric regions)
- we might need to check first if the hifi assembly alone also missed the complex regions 
- if yes (high probability) then we might need to check the hi-c heatmap using hi-Pro to visualize and proceed to a rapid curation if necessary (I think it will be not necessary here).
 
 
### Just by curiosity, I tried to check the T2T status of the Banana genome


### Download the data


```python

wget --no-check-certificate https://www.genoscope.cns.fr/externe/plants/data/Musa_acuminata_pahang_v4.fasta

```


### Check the assembly stats


```python

assembly-stats Musa_acuminata_pahang_v4.fasta


```


Result:

```
stats for Musa_acuminata_pahang_v4.fasta
sum = 479218923, n = 12, ave = 39934910.25, largest = 51314288
N50 = 43117521, n = 6
N60 = 41765374, n = 7
N70 = 40511255, n = 8
N80 = 39373400, n = 9
N90 = 34826099, n = 10
N100 = 10397121, n = 12
N_count = 693156
Gaps = 59


```



### check the telomeres

```python

python FindTelomeres.py Musa_acuminata_pahang_v4.fasta

```

Result:



```python


##########
12 sequences to analyze for telomeric repeats (TTAGGG/CCCTAA) in file Musa_acuminata_pahang_v4.fasta
##########

chr01    Forward (start of sequence)     AACCCTAAACCCTAAACCCTAAACCCTAAACCCTAAACCCTAAACCCTAA
chr01    Reverse (end of sequence)       GGTTTAGGGTTTAGGGTTTAGGGTTTAGGGTTTAGGGTTTAGGGTTTAGG
chr02    Forward (start of sequence)     CCTAAACCCTAAACCCTAAACCCTAAACCTAAACCCTAAACCCTAAACCC
chr02    Reverse (end of sequence)       TTTAGGGTTTAGGGTTTAGGGTTTAGGGTTTAGGGTTTAGGGTTTAGGGT
chr03    Forward (start of sequence)     CTAAACCCTAAACCCTAAACCCTAAACCCTAAACCCTAAACCCTAAACCC
chr03    Reverse (end of sequence)       GGTTTAGGGTTTAGGGTTTAGGGTTTAGGGTTTAGGGTTTAGGGTTTAGG
chr04    Forward (start of sequence)     ACCCTAAACCCTAAACCCTAAACCCTAAACCCTAAACCCTAAACCCTAAA
chr04    Reverse (end of sequence)       GGTTTAGGGTTTAGGGTTTAGGGTTTAGGGTTTAGGGTTTAGGGTTTAGG
chr05    Forward (start of sequence)     AACCCTAAACCCTAAACCCTAAACCCTAAACCCTAAACCCTAAACCCTAA
chr05    Reverse (end of sequence)       GGGTTTAGGGTTTAGGGTTTAGGGTTTAGGGTTTAGGGTTTAGGGTTTAA
chr06    Forward (start of sequence)     AACCCTAAACCCTAAACCCTAAACCCTAAACCCTAAACCCTAAACCCTAA
chr06    Reverse (end of sequence)       TAGGGTTTAGGGTTTAGGGTTTAGGGTTTAGGGTTTAGGGTTTAGGGTTT
chr07    Forward (start of sequence)     CCCTAAACCCTAAACCCTAAACCCTAAACCCTAAACCCTAAACCCTAAAC
chr07    Reverse (end of sequence)       TTTAGGGTTTAGGGTTTAGGGTTTAGGGTTTAGGGTTTAGGGTTTAGGGT
chr08    Forward (start of sequence)     CCCTAAACCCTAAACCCTAAACCCTAAACCCTAAACCCTAAACCCTAAAC
chr08    Reverse (end of sequence)       GGTTTAGGGTTTAGGGTTTAGGGTTTAGGGTTTAGGGTTTAGGGTTTAGG
chr09    Forward (start of sequence)     CCCTAAACCCTAAACCCTAAACCCTAAACCCTAAACCCTAAACCCTAAAC
chr09    Reverse (end of sequence)       GTTTAGGGTTTAGGGTTTAGGGTTTAGGGTTTAGGGTTTAGGGTTTAGGG
chr10    Forward (start of sequence)     CCTAAACCCTAAACCCTAAACCCTAAACCCTAAACCCTAAACCCTAAACC
chr10    Reverse (end of sequence)       GGGTTTAGGGTTTAGGGTTTAGGGTTTAGGGTTTAGGGTTTAGGGTTTAG
chr11    Forward (start of sequence)     AAACCCTAAACCCTAAACCCTAAACCCTAAACCCTAAACCCTAAACCCTA
chr11    Reverse (end of sequence)       TTAGGGTTTAGGGTTTAGGGTTTAGGGTTTAGGGTTTAGGGTTTAGGGTT

Telomeres found: 22 (11 forward, 11 reverse)


```



### Comments:


- Perfect! the Banana genome is T2T but not really gapless as they mentionned in the [paper](https://www.nature.com/articles/s42003-021-02559-3#Sec11).
- FindTelomere python script is working very well though.
- So I can say we simply failed to reach some telomere sequence at the present stage.


### Suggestion

let's check the organ base assembly using pacbio hifi and hic data/ primary assembly. we can screen each of them for telomere search then we can see if by chance, one of them is better in term of T2T stuff.



