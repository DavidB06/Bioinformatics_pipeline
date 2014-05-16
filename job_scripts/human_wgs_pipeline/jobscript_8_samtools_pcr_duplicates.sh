#!/bin/bash

#BSUB -n 4
#BSUB -J X_pcr_duplicates
#BSUB -o X_pcr_duplicates.o%J
#BSUB -e X_pcr_duplicates.o%J
#BSUB -u dballi@upenn.edu

samtools rmdup X_1_2.srtd.reh.bam X_1_2.srtd.reh.ddup.bam
