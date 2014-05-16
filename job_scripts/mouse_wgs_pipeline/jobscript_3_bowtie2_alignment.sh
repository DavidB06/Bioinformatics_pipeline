#!/bin/bash

#BSUB -n 4
#BSUB -J X_fq_align
#BSUB -o X_fq_align.o%J
#BSUB -e X_fq_align.o%J
#BSUB -u dballi@upenn.edu

## make sure to repalce X with fq ID 

bowtie2 --end-to-end --sensitive --rg-id "@RG\tID:1\tLB:project_name\tSM:1\tPL:ILLUMINA" -p 8 -x /home/dballi/bin/Bowtie2Index_mm10/genome -1 X_1.fq -2 X_2.fq -S X_1_2.sam