#!/bin/bash

#BSUB -n 4
#BSUB -J X_mpileup
#BSUB -o X_mpileup.o%J
#BSUB -e X_mpileup.o%J
#BSUB -u dballi@upenn.edu

samtools mpileup -f /home/dballi/bin/Bowtie2Index_hg19/hg19-bt2.fa.fai X_1_2-normal.srtd.reh.ddup.bam Y_1_2-tumor.srtd.red.ddup.bam > X_1_2-normal-tumor.pileup


# varscan needs mpileup of noram then tumor in file 