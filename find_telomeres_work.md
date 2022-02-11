

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

## Try to find out telomeres in the HiFi-assembly.

- check the assembly stats
``` bash 
assembly-stats AB.prim.fa

````
**Results:**

```python

stats for AB.prim.fa
sum = 970894268, n = 64, ave = 15170222.94, largest = 55314054
N50 = 32624131, n = 12
N60 = 30440209, n = 16
N70 = 29619443, n = 19
N80 = 26595296, n = 22
N90 = 22011831, n = 26
N100 = 3148, n = 64
N_count = 0
Gaps = 0
```


### Try to find out telomeres in the unscaffold sequences.

- Primary assembly

```python

python FindTelomeres.py AB.prim.fa


```

Output:

```python

##########
64 sequences to analyze for telomeric repeats (TTAGGG/CCCTAA) in file AB.prim.fa
##########

ptg000002l_1 	 Forward (start of sequence) 	 CTAACCCTAACCCTAACCCTAACCCTAACCCTAACCCTAACCCTAACCCT
ptg000003l_1 	 Reverse (end of sequence) 	 TTAGGGTTAGGGTTAGGGTTAGGGTTAGGGTTAGGGTTAGGGTTAGGGTT
ptg000012l_1 	 Forward (start of sequence) 	 AACCCTAACCCTAACCCTAACCCTAACCCTAACCCTAACCCTAACCCTAA
ptg000013l_1 	 Forward (start of sequence) 	 AACCCTAACCCTAACCCTAACCCTAACCCTAACCCTAACCCTAACCCTAA
ptg000020l_1 	 Forward (start of sequence) 	 TAACCCTAACCCTAACCCTAACCCTAACCCTAACCCTAACCCTAACCCTA
ptg000021l_1 	 Forward (start of sequence) 	 CTAACCCTAACCTAACCCTAACCCTAACCCTAACCCTAACCCCTAACCCT
ptg000028l_1 	 Forward (start of sequence) 	 AACCCTGAACCTACCCTACCCCCTCACCCTACCCCTACCCAAACCCTAAC
ptg000071l_1 	 Forward (start of sequence) 	 CTAACCCTAACCCTAACCCTAACCCTAACCCTAACCCTAACCCCTAACCC
ptg000078l_1 	 Reverse (end of sequence) 	 GTTAGGGTAGGGTTAGGGTCTAGGGTTCAGGGTTAGGGTTAGGGTAGGGT
ptg000082l_1 	 Reverse (end of sequence) 	 TAGAGGGTTTAGGGTTAGGTTAGGGTTTAGGGTTAGGGTTAGTAGGGTTA
ptg000142l_1 	 Reverse (end of sequence) 	 TAGGGTTAGGGGTTAGGGTTAGGGTTAGGGTTAGGGTTAGGGTTAGGGTT
ptg000179l_1 	 Reverse (end of sequence) 	 TAGGGTTAGGGTTAGGGTTAGGGTTAGGGTTAGGGTTAGGGTTAGGGGTT
```
No single contig captured telomeric ends in Primary Hifiasm assembly!
- Haploytype 1 assembly

```python

python FindTelomeres.py AB.hap1.fa


```
Output:

```python
##########
104 sequences to analyze for telomeric repeats (TTAGGG/CCCTAA) in file AB.hap1.fa
##########

h1tg000004l_1 	 Forward (start of sequence) 	 AACCCTAACCCTAACCCTAACCCTAACCCTAACCCTAACCCTAACCCTAA
h1tg000014l_1 	 Reverse (end of sequence) 	 GGTTAGGGTTAGGGTTAGGGTTAGGGTTAGGGTTAGGGTTAGGGTTAGGG
h1tg000019l_1 	 Forward (start of sequence) 	 AACCCTAACCCTAACCCTAACCCTAACCCTAACCCTAACCCTAACCCTAA
h1tg000020l_1 	 Reverse (end of sequence) 	 GTTAGGGTAGGGTTAGGGTCTAGGGTTCAGGGTTAGGGTTAGGGTAGGGT
h1tg000027l_1 	 Forward (start of sequence) 	 CTAACCCTAACCCTAACCCAACCTAACCCTAACCCTAACCCTAACCCCTA
h1tg000028l_1 	 Forward (start of sequence) 	 TAACCCTAACCCTAACCCTAACCCTAACCCTAACCCTAACCCTAACCCTA
h1tg000029l_1 	 Forward (start of sequence) 	 CTAACCCTAACCTAACCCTAACCCTAACCCTAACCCTAACCCCTAACCCT
h1tg000039l_1 	 Reverse (end of sequence) 	 GTTAGGGTTAGGGTTAGGGTTAGGGTTAGGGTTAGGGTTAGGGTTAGGGT
h1tg000054l_1 	 Reverse (end of sequence) 	 GTTAGGGTTTGGGTAGGGGTAGGGTGAGGGGGTAGGGTAGGTTCAGGGTT
h1tg000103l_1 	 Reverse (end of sequence) 	 GGGTTGGGGGAGGGTTAGGGTTAGGGTTAGGGTTAGGGTTAGGGTTAGGG
h1tg000147l_1 	 Forward (start of sequence) 	 CTAACCCTAACCCTAAACCCTAACCCTAACCCTAACCCTAACCCTAACCC
h1tg000155l_1 	 Forward (start of sequence) 	 CCCTAACCCAACCCTAACCCTAACCCTAACCCTAACCCTAACCCTAACCC
h1tg000214l_1 	 Reverse (end of sequence) 	 GGGTTAGGGTTAGGGTTAGGGTTAGGGTTAGGGTTAGGGTTAGGGTTAGG
h1tg000356l_1 	 Reverse (end of sequence) 	 TAGGGTTAGGGTTAGGGTTAGGGTTAGGGTTAGGGTTAGGGTTAGGGGTT
h1tg000388l_1 	 Reverse (end of sequence) 	 GTAGGGTTAGGGTAGAGGGCTAGGGGTAGGGGTAGGTTTAGGGTGTGGGG

Telomeres found: 15 (7 forward, 8 reverse)
```
Only contig h1tg000014l_1 seems to have captured telomeric ends in hap1 Hifiasm-assembly!

- Haploytype 2 assembly

```python

python FindTelomeres.py AB.hap2.fa


```

Output:

```python

##########
183 sequences to analyze for telomeric repeats (TTAGGG/CCCTAA) in file AB.hap2.fa
##########

h2tg000003l_1_1 	 Reverse (end of sequence) 	 AGGGTTAGGGTTAGGGTTAGGGTTAGGGTTAGGGTTAGGGTTAGGGTTAG
h2tg000013l_1_1 	 Forward (start of sequence) 	 AACCCTAACCCTAACCCTAACCCTAACCCTAACCCTAACCCTAACCCTAA
h2tg000046l_1_1 	 Reverse (end of sequence) 	 AGGGTTAGGGTATTAGGGTTAGGGTTAGGGTTAGGGTTAGGGTTAGGGTT
h2tg000077l_1_1 	 Reverse (end of sequence) 	 TTAGGGTTAGGGTTAGGGTTAGGGTTAGGGTTAGGGTTAGGGTTAGGGTT
h2tg000162l_1_1 	 Reverse (end of sequence) 	 GGGTTAGGGTTAGGGGTTAGGGTTAGGGTTAGGGTTAGGGTTAGGGTTAG
h2tg000212l_1_1 	 Reverse (end of sequence) 	 TAGAGGGTTTAGGGTTAGGTTAGGGTTTAGGGTTAGGGTTAGTAGGGTTA
h2tg000285l_1_1 	 Forward (start of sequence) 	 CCTAACCCTAACCCTCACCCTAACCCTCAACCTAACCCTACCCCTAACCC

Telomeres found: 7 (2 forward, 5 reverse)

```

Only contig h2tg000003l_1_1 seems to have captured telomeric ends in hap2 Hifiasm-assembly!

### Comments
Obviously, hifiasm couldn't assembly the chromosomes ends. But where are these reads? We should at leats found these reads in the assembly!! 
Were these regions covered during sequening? I've checkd in shasta-assembly based on ONT ong redas:
```python

python FindTelomeres.py shasta.ONT.asm.fasta

```

Output:

```python

##########
827 sequences to analyze for telomeric repeats (TTAGGG/CCCTAA) in file shasta.ONT.asm.fasta
##########

852 length 60891 	 Reverse (end of sequence) 	 TTATGGTTAGGGGTAGGTTAAGATTAGGAATAGGTAAGGGTGGGGGCTAG
1494 length 2133 	 Reverse (end of sequence) 	 TTATGGTTAGGGGTAGGTTAAGATTAGGAATAGGTAAGGGTGGGGGCTAG

Telomeres found: 2 (0 forward, 2 reverse)

```

As we cannsee it's even worts in the fasta assembly. Only two contig have partial telomeric end. Let's brain strom on this issue...
