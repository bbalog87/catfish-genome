## Take only chromosome 1 to 28

grep -i -e "Chr1" -e "Chr2" HiC.coverage.norm.bed | awk '!/Chr29/' > hic.cov28
grep -i -e "Chr1" -e "Chr2" ILM.coverage.norm.bed | awk '!/Chr29/' > ilm.cov28
grep -i -e "Chr1" -e "Chr2" ONT.coverage.norm.bed | awk '!/Chr29/' > ont.cov28
grep -i -e "Chr1" -e "Chr2" HiFi.coverage.norm.bed | awk '!/Chr29/' > hifi.cov28
