#!/bin/bash

#BSUB -n 4
#BSUB -J X_bam_sort
#BSUB -o X_bam_sort.o%J
#BSUB -e X_bam_sort.o%J
#BSUB -u dballi@upenn.edu

samtools sort X_1_2.bam X_1_2.srtd -m 80000000000