#!/bin/bash

#BSUB -n 4
#BSUB -J X_fq_align
#BSUB -o X_fq.o%J
#BSUB -e X_fq.o%J
#BSUB -u dballi@upenn.edu


bowtie2 --end-to-end --sensitive --rg-id "@RG\tID:1\tLB:project_name\tSM:1\tPL:ILLUMINA" -p 8 -x /home/dballi/bin/Bowtie2Index_hg19/genome -1 X_1.fq -2 X_2.fq | samtools view - -Sb -h -t hg19-bt2.fa.fai -o X_1_2.bam