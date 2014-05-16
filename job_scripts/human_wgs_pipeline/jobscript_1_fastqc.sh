#!/bin/bash

#BSUB -n 4
#BSUB -J X_fq_qc
#BSUB -o X_fq_qc.o%J
#BSUB -e X_fq_qc.o%J
#BSUB -u dballi@upenn.edu

## QC assement of fq files using Fastqc

fastqc X_1.fq -f fastq -o fastqc/

## fastqc/ is sub-directory in working seq directory
## repeat for each X.fq file 
