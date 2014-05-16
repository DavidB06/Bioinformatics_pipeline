#!/bin/bash

#BSUB -n 4
#BSUB -J X_variants
#BSUB -o X_variants.o%J
#BSUB -e X_variants.o%J
#BSUB -u dballi@upenn.edu

# create list of all BAMs 
# ls *.srtd.reh.ddup.bam > bamlist.txt

samtools mpileup -d 200 -D -B -f /home/dballi/bin/Bowtie2Index_mm9/mm9-bt2.fa -b bamlist.txt -l /home/dballi/mm9_bed_SureSelect/mm9_target_Covered.bed -u| bcftools view - -v -c -g > X_variants.vcf


## we are pipping mpileup of ALL BAM files for each sample 
## to BCF tools to call variants in VCF file 