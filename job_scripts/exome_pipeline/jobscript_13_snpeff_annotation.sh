#!/bin/bash

#BSUB -n 4
#BSUB -J X_snpeff
#BSUB -o X_snpeff.o%J
#BSUB -e X_snpeff.o%J
#BSUB -u dballi@upenn.edu

java -Xmx46 -jar /home/dballi/NGS_software/snpEff/snpEff.jar eff -c /home/dballi/NGS_software/snpEff/snpEff.config -v -cancer -cancerSample samples_cancer.txt GRCm37.67 variants.vcf > variants.eff.vcf

# annotation for mouse mm9 

