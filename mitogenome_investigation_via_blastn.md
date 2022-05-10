### Grab from NCBI the mitogenome assembly of Clarias gariepinus mitochondrion, complete genome [NC_027661.1](https://www.ncbi.nlm.nih.gov/search/all/?term=NC_027661.1)

### Check the assembly size

```python

assembly-stats mitogenome.txt

```


### Got this


```python

stats for mitogenome.txt
sum = 16745, n = 1, ave = 16745.00, largest = 16745
N50 = 16745, n = 1
N60 = 16745, n = 1
N70 = 16745, n = 1
N80 = 16745, n = 1
N90 = 16745, n = 1
N100 = 16745, n = 1
N_count = 0
Gaps = 0


```


### Perform the blastn search

```python

blastn -subject CGAR.genome.fa -query mitogenome.txt -out mito_fish.txt -outfmt 6 

```



###  Got this
qseqid	sseqid	pident	length	mismatch		gapopen	qstart	qend	sstart	send	evalue	bitscore
NC_027661.1	Chr_3	100.00	48	0	0	7514	7561	12625675	12625628	8e-16	89.8
NC_027661.1	Chr_24	98.16	7834	143	1	1	7834	22763174	22755342	0.0	13668
NC_027661.1	Chr_24	96.48	3660	124	4	12851	16508	22766831	22763175	0.0	 6039
NC_027661.1	Chr_28	84.80	1526	165	24	14488	16000	18786211	18784740	0.0	 1471
NC_027661.1	Chr_28	90.35	518	40	10	15996	16508	18778748	18778236	0.0	  671
NC_027661.1	Chr_28	91.05	458	17	5	159	611	18778104	18777666	1e-168	  597
NC_027661.1	Chr_28	89.08	458	45	4	13453	13910	18786663	18786211	1e-158	  564
NC_027661.1	Chr_28	87.86	412	38	8	12998	13404	18787078	18786674	2e-131	  473
NC_027661.1	Chr_28	96.90	129	2	2	1	128	18778235	18778108	1e-53	  215



### Conclusion

I was expecting some hits in the unscaffold sequences but *nope*! There is not fully circularized mitogenome in the CGAR.genome.fa


