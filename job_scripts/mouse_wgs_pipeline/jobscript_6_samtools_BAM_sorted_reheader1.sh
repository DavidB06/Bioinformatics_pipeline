#!/bin/bash

#BSUB -n 4
#BSUB -J X_bam_sort_reheader
#BSUB -o X_bam_sort_reheader.o%J
#BSUB -e X_bam_sort_reheader.o%J   
#BSUB -u dballi@upenn.edu

## this will retrive original header 
## you will need to open sam file in nano or vi
## and change 'S0:unsorted' to 'S0:sorted'

samtools view -H X_1_2.srtd.bam > X_1_2_originalheader.sam

