
# Extract the 28 largest scaffolds

```python

seqtk subseq AB.prim.scaff_FINAL.gapfilled.fa 28.list > 2_8.fasta

```


# Get the gap position


```python

perl -ne 'chomp;if( />(.*)/){$head = $1; $i=0; next};@a=split("",$_); foreach(@a){$i++; if($_ eq "N" && $s ==0 ){$z=$i-1; print "$head\t$z"; $s =1}elsif($s==1 && $_ ne "N"){$j=$i-1;print "\t$j\n";$s=0}}' 2_8.fasta

```


# The resulting position was 

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


# Counting the number of N

```python

wc -m gap_seq.fasta

```


I got this



```python

531 gap_seq.fasta

```

So we got 531 N to fill. So 531 bp to find. I would like to suggest to rerun LG gapcloser using only the scaffold1 and the canu-cleaned oxford nanopore data. Or option 2, map the illumina data, oxfore nanopore and hifi data onto the scaffold 1 and visualize in IGV and cross cheched the targeted region.





# Verification step


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
