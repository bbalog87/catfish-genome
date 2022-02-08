
### Extract the 28 largest scaffolds

```python

seqtk subseq AB.prim.scaff_FINAL.gapfilled.fa 28.list > 2_8.fasta

```

### Check the assembly stats


```python

assembly-stats 2_8.fasta

```


I got this


```python

stats for 2_8.fasta
sum = 960667316, n = 28, ave = 34309547.00, largest = 52273159
N50 = 33728944, n = 12
N60 = 32181005, n = 15
N70 = 30627632, n = 18
N80 = 29619443, n = 21
N90 = 25968190, n = 25
N100 = 21035469, n = 28
N_count = 500
Gaps = 1

```

The gap is in somewhere in the 28 scaffolds. Let's check where it is.

### Get the gap position


```python

perl -ne 'chomp;if( />(.*)/){$head = $1; $i=0; next};@a=split("",$_); foreach(@a){$i++; if($_ eq "N" && $s ==0 ){$z=$i-1; print "$head\t$z"; $s =1}elsif($s==1 && $_ ne "N"){$j=$i-1;print "\t$j\n";$s=0}}' 2_8.fasta

```


### The resulting position was 

```python

scaffold_1      35921823        35922323

```

I created a bed file with the previous coordinates in 2_8.bed file then run:




```python
 
bedtools getfasta -fi 2_8.fasta -bed 2_8.bed > gap_seq.fasta

```



I got this


```

>scaffold_1:35921823-35922323
NNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNN


```



So we got 500 N to fill or not. I would like to suggest to rerun LG gapcloser using only the scaffold1 and the canu-cleaned oxford nanopore data. Or option 2, map the illumina data, oxfore nanopore and hifi data onto the scaffold 1 and visualize in IGV and cross cheched the targeted region. Or option 3 use the canu assembly of ONT the aligned with mummer and get the posisiton that covered the map. design a primer and check by doing a PCR.





### Verification step


Just to check I change the positon in the bed file  like start-1 and end+1 (scaffold_1:35921822-35922324) to see if my script missed some N



```python
 
bedtools getfasta -fi 2_8.fasta -bed 2_8.bed > gap_seq_verification.fasta

```


I got this



```python

>scaffold_1:35921822-35922324
ANNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNC

```


So I am now very sure about the exact position of the gap in the scaffold 1. In conclusion we have 531 Ns that were inserted in the scaffold1 from 35921823 to 35922323.
