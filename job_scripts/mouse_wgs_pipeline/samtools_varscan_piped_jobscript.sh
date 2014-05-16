#!/bin/bash

#BSUB -n 4
#BSUB -J X_mpileup_varscan
#BSUB -o X_mpileup_varscan.o%J
#BSUB -e X_mpileup_varscan.o%J
#BSUB -u dballi@upenn.edu

samtools mpileup -q 1 -f /home/dballi/bin/Bowtie2Index_mm10/mm10-bt2.fa.fai X-normal.srtd.reh.ddup.bam X-tumor.srtd.red.ddup.bam | - java -jar /home/dballi/bin/varscan.jar copynumber X-normal-tumor.copynumber --mpileup 1 
