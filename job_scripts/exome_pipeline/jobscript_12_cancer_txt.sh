#!/bin/bash

#BSUB -n 4
#BSUB -J cancertxt
#BSUB -o cancertxt.o%J
#BSUB -e cancertxt.o%J
#BSUB -u dballi@upenn.edu

## -cancer -canceSample samples_cancer.txt
# need to generate TXT file 
# tab-separated TXT file having two columns
# E.g.: Create a TXT file named 'samples_cancer.txt'
# Patient_01_Germline	Patient_01_Somatic
# Patient_02_Germline	Patient_02_Somatic
# Patient_03_Germline	Patient_03_Somatic
# Patient_04_Germline	Patient_04_Somatic