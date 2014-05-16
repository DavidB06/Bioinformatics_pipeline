#!/bin/bash

#BSUB -n 4
#BSUB -J X_varscan
#BSUB -o X_varscan.o%J
#BSUB -e X_varscan.o%J
#BSUB -u dballi@upenn.edu

java -jar /home/dballi/bin/varscan.jar copynumber X_1_2-normal-tumor.pileup X_1_2-normal-tumor.copynumber --mpileup 1

## .copynumber is output base name 
## need GC correction
