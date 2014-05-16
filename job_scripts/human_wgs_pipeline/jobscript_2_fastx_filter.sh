#!/bin/bash

#BSUB -n 4
#BSUB -J X_fastx
#BSUB -o X_fastx.o%J
#BSUB -e X_fastx.o%J
#BSUB -u dballi@upenn.edu

## Filtering of reads with scores below N threshold

fastq_quality_filter -q N -i X_1.fq -o X_1_filter.fq