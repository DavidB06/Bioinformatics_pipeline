#!/bin/bash

#BSUB -n 4
#BSUB -J X_sam_index
#BSUB -o X_sam_index.o%J
#BSUB -e X_sam_index.o%J
#BSUB -u dballi@upenn.edu

samtools index X_1_2.srtd.reh.ddup.bam


## not sure this step is necessary for CNV identification 
## "Index sorted alignment for fast random access." - per samtools manual