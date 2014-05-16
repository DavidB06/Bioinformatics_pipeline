#!/bin/bash

#BSUB -n 4
#BSUB -J X_bam_sort_reheader
#BSUB -o X_bam_sort_reheader.o%J
#BSUB -e X_bam_sort_reheader.o%J   
#BSUB -u dballi@upenn.edu

## this add the corrected "sorted header" to Bam file 
## reheader command only appends header file from SAM

samtools reheader X_1_2_originalheader.sam X_1_2.srtd.bam > X_1_2.srtd.reh.bam
