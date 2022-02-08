

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
