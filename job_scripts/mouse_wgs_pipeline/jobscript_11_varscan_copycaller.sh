#!/bin/bash

#BSUB -n 4
#BSUB -J X_varscan_copycaller
#BSUB -o X_varscan_copycaller.o%J
#BSUB -e X_varscan_copycaller.o%J
#BSUB -u dballi@upenn.edu

java -jar /home/dballi/bin/varscan.jar copyCaller X_1_2-normal-tumor.copynumber —output-file X_1_2-normal-tumor.copynumber.called