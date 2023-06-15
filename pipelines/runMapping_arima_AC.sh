#!/bin/bash

##############################################
# ARIMA GENOMICS MAPPING PIPELINE 02/02/2021 #
##############################################

#Below find the commands used to map HiC data.

#Replace the variables at the top with the correct paths for the locations of files/programs on your system.

#This bash script will map one paired end HiC dataset (read1 & read2 fastqs). Feel to modify and multiplex as you see fit to work with your volume of samples and system.

##########################################
# Commands #
##########################################



#SRA='basename_of_fastq_files'
#LABEL='overall_exp_name'
BWA='/home/fb3/nguinkal/anaconda3/envs/salsa_env/bin/bwa'
SAMTOOLS='/home/fb3/nguinkal/anaconda3/envs/salsa_env/bin/samtools'

#IN_DIR='/path/to/gzipped/fastq/files'
REF='/projekte/I3-PikeperchAssembly/CATFISH-PROJECT/SALSA-SCAFFOLDING/AC.fa'
FAIDX='AC.fa.fai'
PREFIX='AC'
RAW_DIR='/projekte/I3-PikeperchAssembly/CATFISH-PROJECT/SALSA-SCAFFOLDING/SALSA-2.2/BAM_OUT'
FILT_DIR='/projekte/I3-PikeperchAssembly/CATFISH-PROJECT/SALSA-SCAFFOLDING/SALSA-2.2/FILTERED_BAM'
FASTQ1='/projekte/I3-PikeperchAssembly/CATFISH-PROJECT/SALSA-SCAFFOLDING/HiC.R1.fastq.gz'
FASTQ2='/projekte/I3-PikeperchAssembly/CATFISH-PROJECT/SALSA-SCAFFOLDING/HiC.R2.fastq.gz'
COMB_DIR='/projekte/I3-PikeperchAssembly/CATFISH-PROJECT/SALSA-SCAFFOLDING/SALSA-2.2/COMBINED_BAM'
FILTER='/projekte/I3-PikeperchAssembly/CATFISH-PROJECT/SALSA-SCAFFOLDING/SALSA-2.2/Scripts/filter_five_end.pl'
COMBINER='/projekte/I3-PikeperchAssembly/CATFISH-PROJECT/SALSA-SCAFFOLDING/SALSA-2.2/Scripts/two_read_bam_combiner.pl'
STATS='/projekte/I3-PikeperchAssembly/CATFISH-PROJECT/SALSA-SCAFFOLDING/SALSA-2.2/mapping_pipeline/get_stats.pl'
PICARD='/projekte/I3-PikeperchAssembly/CATFISH-PROJECT/SALSA-SCAFFOLDING/picard/build/libs/picard.jar'
TMP_DIR='/projekte/I3-PikeperchAssembly/CATFISH-PROJECT/SALSA-SCAFFOLDING/SALSA-2.2/TEMP'
PAIR_DIR='/projekte/I3-PikeperchAssembly/CATFISH-PROJECT/SALSA-SCAFFOLDING/SALSA-2.2/PAIRED'
REP_DIR='/projekte/I3-PikeperchAssembly/CATFISH-PROJECT/SALSA-SCAFFOLDING/SALSA-2.2/DEDUP'
#REP_LABEL=$LABEL\_rep1
#MERGE_DIR='/path/to/final/merged/alignments/from/any/biological/replicates'
MAPQ_FILTER=10
THREADS=100


#echo "### Step 00: Check output directories exist & create them as needed"
#[ -d $RAW_DIR ] || mkdir -p $RAW_DIR
#[ -d $FILT_DIR ] || mkdir -p $FILT_DIR
#[ -d $TMP_DIR ] || mkdir -p $TMP_DIR
#[ -d $PAIR_DIR ] || mkdir -p $PAIR_DIR
#[ -d $REP_DIR ] || mkdir -p $REP_DIR
#[ -d $MERGE_DIR ] || mkdir -p $MERGE_DIR

# Run only once! Skip this step if you have already generated BWA index files
echo "### Step 0: Index reference"
bwa index -a bwtsw -p $PREFIX $REF


echo "### Step 1.A: FASTQ to BAM (forward reads)"
echo "\
$BWA mem -t $THREADS $PREFIX $FASTQ1 | $SAMTOOLS view -Sb - > $RAW_DIR/${PREFIX}_1.bam"
$BWA mem -t $THREADS $PREFIX $FASTQ1 | $SAMTOOLS view -Sb - > $RAW_DIR/${PREFIX}_1.bam
echo ""



echo "### Step 2.A: Filter 5' end (forward reads)"
echo "\
$SAMTOOLS view -h $RAW_DIR/${PREFIX}_1.bam | perl $FILTER | $SAMTOOLS view -@$THREADS -Sb - > $FILT_DIR/${PREFIX}_1.bam"
$SAMTOOLS view -h $RAW_DIR/${PREFIX}_1.bam | perl $FILTER | $SAMTOOLS view -@$THREADS -Sb - > $FILT_DIR/${PREFIX}_1.bam &&
echo "" || exit -1


echo "### Step 1.B: FASTQ to BAM (reverse reads)"
echo "\
$BWA mem -t $THREADS $PREFIX $FASTQ2 | $SAMTOOLS view -Sb - > $RAW_DIR/${PREFIX}_2.bam"
$BWA mem -t $THREADS $PREFIX $FASTQ2 | $SAMTOOLS view -Sb - > $RAW_DIR/${PREFIX}_2.bam
echo ""

echo "### Step 2.B: Filter 3' end (reverse reads)"
echo "\
$SAMTOOLS view -h $RAW_DIR/${PREFIX}_2.bam | perl $FILTER | $SAMTOOLS view -@$THREADS -Sb - > $FILT_DIR/${PREFIX}_2.bam"
$SAMTOOLS view -h $RAW_DIR/${PREFIX}_2.bam | perl $FILTER | $SAMTOOLS view -@$THREADS -Sb - > $FILT_DIR/${PREFIX}_2.bam &&
echo "" || exit -1

echo "### Step 3.A: Filter Combiner"
echo "\
perl $COMBINER $FILT_DIR/${PREFIX}_1.bam $FILT_DIR/${PREFIX}_2.bam | $SAMTOOLS view -@$THREADS -Sb > $COMB_DIR/$PREFIX.bam"
perl $COMBINER $FILT_DIR/${PREFIX}_1.bam $FILT_DIR/${PREFIX}_2.bam | $SAMTOOLS view -@$THREADS -Sb > $COMB_DIR/$PREFIX.bam
echo ""


echo "### move final bam to current directory"
echo "cp $COMB_DIR/$PREFIX.bam ."
cp $COMB_DIR/$PREFIX.bam .
#$SAMTOOLS view -q $MAPQ_FILTER -b $PREFIX.bam > $PREFIX.q10.bam


echo "#### Finished Mapping!"
echo ""


echo "# Sorting by coordinates"
echo "\
$SAMTOOLS sort -@$THREADS -T $PREFIX.bam.tmp -m2G -O bam -o $PREFIX.sort.bam $PREFIX.bam"
$SAMTOOLS sort -@$THREADS -T $PREFIX.bam.tmp -m2G -O bam -o $PREFIX.sort.bam $PREFIX.bam
echo "\
$SAMTOOLS index $PREFIX.sort.bam"
$SAMTOOLS index $PREFIX.sort.bam
echo ""
#END

echo "### Step 4: Mark duplicates"

echo "\
java -jar -Xmx180g $PICARD MarkDuplicates REMOVE_DUPLICATES=true I=$PREFIX.sort.bam O=$REP_DIR/$PREFIX.sort.dedup.bam M=$REP_DIR/metrics.txt ASSUME_SORT_ORDER=coordinate MAX_FILE_HANDLES_FOR_READ_ENDS_MAP=1024"
/usr/bin/java  -jar -Xmx180g  $PICARD MarkDuplicates REMOVE_DUPLICATES=true I=$PREFIX.sort.bam O=$REP_DIR/$PREFIX.sort.dedup.bam M=$REP_DIR/metrics.txt ASSUME_SORT_ORDER=coordinate MAX_FILE_HANDLES_FOR_READ_ENDS_MAP=1024
echo ""

echo "# Resort to name order"
$SAMTOOLS view -q $MAPQ_FILTER -b $REP_DIR/$PREFIX.sort.dedup.bam > $PREFIX.unique.bam
$SAMTOOLS sort -@$THREADS -n -T $PREFIX.dedup2.tmp -m2000m -O bam -o $PREFIX.unique.sorted.bam $PREFIX.unique.bam


echo "# Converting to bed "
echo "bedtools bamtobed -i $PREFIX.unique.sorted.bam > $PREFIX.unique.sorted.bed"
bedtools bamtobed -i $PREFIX.unique.sorted.bam > $PREFIX.unique.sorted.bed

### Sort bed file
sort -k 4 $PREFIX.unique.sorted.bed >  $PREFIX.unique.aln.bed

#echo "# Resort to name order"
#echo "\
#$SAMTOOLS sort -@$THREADS -n -T $PREFIX.dedup.tmp -m2000m -O bam -o $PREFIX.sort_n.dedup.bam REP_DIR/$PREFIX.sort.dedup.bam"
#$SAMTOOLS sort -@$THREADS -n -T $PREFIX.dedup.tmp -m2000m -O bam -o $PREFIX.sort_n.dedup.bam REP_DIR/$PREFIX.sort.dedup.bam

echo "#### Finished removing dulicates!"
echo ""


