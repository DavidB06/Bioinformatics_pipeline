#!/bin/bash

#BSUB -n 4
#BSUB -J X_bam_view
#BSUB -o X_bam_view.o%J
#BSUB -e X_bam_view.o%J
#BSUB -u dballi@upenn.edu
#BSUB -u balli.dave@gmail.com

samtools view -hb -t /home/dballi/bin/Bowtie2Index_mm10/mm10-bt2.fa.fai X_1_2.sam -o X_1_2.bam