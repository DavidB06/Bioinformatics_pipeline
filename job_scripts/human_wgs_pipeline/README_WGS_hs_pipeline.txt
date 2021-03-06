2014-4-29 
specific for human sequence alignment

David

bioinformatics pipeline for PMACs cluster including job script IDs for HUMAN WHOLE GENOME SEQ 
for CNV identification

appropriate job script for submission follows # symbol (e.g. # fastqc_jobscript.sh)
job scripts have been written in Bash .sh format - you can easily do this with Perl, Python, etc.

as example: all fq files have 'X_1' or 'X_2' identification - aligned files have 'X_1_2' ids
real samples will be called 'Capan1_1.fq' and 'Capan1_2.fq' for paired reads - aligned to 'Capan1_1_2.SAM/BAM'

1) download fq files 
	- From BGI/PennNGS core to cluster directly using SCP, SFTP via command line 
	- or GUI like FETCH

2) QC assessment of fq files
	1) FastQC

	# jobscript_1_fastqc.sh

	2) Fastx-toolkit - use filter function to remove reads with lower than N quality score (phred) 

	# jobscript_2_fastx_filter.sh

3) Alignment to mouse ref genome (aligning to Hg19)
	1) Bowtie2 using —end-to-end —sensitive parameters 

	# jobscript_3_bowtie2_alignment.sh

	2) I am not currently piping bowtie2 to samtools directly

4) SAM-BAM conversion
	1) using samtools view 

	# jobscript_4_samtools_SAM-BAM_view.sh

5) BAM sort 
	1) samtools sort function
	2) CRITICAL FOR CNV ID WITH VARSCAN - NEED SORTED FILE
	
	# jobscript_5_samtools_BAM_sorted.sh

6) Reheadering of sorted BAM file (multistep process)
	1) not sure why samtools doesn’t updated BAM file
	
	# jobscript_6_samtools_BAM_sorted_reheader1.sh
	
	2) open resulting sam file and edit “S0: unsorted” to “S0: sorted” in nano,vi (other text editor)
	
	# jobscript_7_samtools_BAM_sorted_reheader2.sh
	
	3) basically - this step corrects sorted header and applies to to sorted BAM header only
	4) can delete X_1_2_originalheader.sam file afterwards 

7) removal of PCR duplicates
	1) samtools rmdup program
	2) critical for CNV analysis due to PCR duplicates confounding CBS analysis
	3) can not remove reads on separate chromosomes*
	
	# jobscript_8_samtools_pcr_duplicates.sh


8) You do not need to index samtools file for CNV analysis 

9) Compiling various BAM files for CNV analysis downstream
	1) use mpileup to create single file for normal-tumor sample pair
	2) has to be in normal, tumor format for varscan
	
	# jobscript_9_samtools_mpileup.sh

10) Identification of Copy using Varcan.jar
	1) This program needs sorted Bam file parsed through mpileup

	# jobscript_10_varscan_copynumber.sh

	2) creates single output file, called X-normal-tumor-copynumber 
	containing raw copynumber calls

11) GC correction with Varscan CopyCaller program
	1) needs input .copynumber from previous step

	# jobscript_11_varscan_copycalled.sh

	2) generates GC adjusted information on copy

12) Download final your.copynumber file from cluster to computer 
	1) use SCP, SFTP, FETCH GUI to move file
	2) these files are small enough to manage on personal laptop
	3) also - since most downstream applications are visual (R, Circos),
	it is easier to move these files off the cluster 
	
13) Data analysis using DNAcopy - R bioconductor library
	1) http://www.bioconductor.org/packages/2.3/bioc/manuals/DNAcopy/man/DNAcopy.pdf 
	2) example R script:
	- library(DNAcopy)
	- cn <- read.table(“your.copynumber.file”, header=F)
	- CNA.object <- CNA(genomdat = cn[,6], chrom = cn[,1], maploc = cn[,2], data.type = 'logratio’)
	- CNA.smoothed <- smooth.CNA(CNA.object)
	- segs <- segment(CNA.smoothed, verbose=0, min.width=2)
	- seg2 <- segs$output
	- write.table(segs2[,2:6], file=“out.file”, row.names=F, colnames=F, quote=F sep=“\t”

14) calculate FDR (q values) - fdrtool package?

15) Circos




## prep work done before hand

1. reference genome download and build (step 0.2 of cureffi.org walk through)  (not done yet 4/2)
	human genome CNV pipeline 
1. reference genome download and build (step 0.2 of cureffi.org walk through)  (not done yet 4/2)
	a) wget ftp://hgdownload.cse.ucsc.edu/goldenPath/hg19/bigZips/chromFa.tar.gz
	b) gunzip chromFa.tar.gz
	c) cat chr1.fa chr2.fa chr3.fa chr4.fa chr5.fa chr6.fa chr7.fa chr8.fa chr9.fa chr10.fa chr11.fa chr12.fa chr13.fa chr14.fa chr15.fa chr16.fa chr17.fa chr18.fa chr19.fa chr20.fa chr21.fa chr22.fa chrX.fa chrY.fa chrM.fa chr1_gl000191_random.fa chr1_gl000192_random.fa chr4_gl000193_random.fa chr4_gl000194_random.fa chr7_gl000195_random.fa chr8_gl000196_random.fa chr8_gl000197_random.fa 		chr9_gl000198_random.fa chr9_gl000199_random.fa chr9_gl000200_random.fa chr9_gl000201_random.fa chr11_gl000202_random.fa chr17_gl000203_random.fa chr17_gl000204_random.fa chr17_gl000205_random.fa chr17_gl000206_random.fa chr18_gl000207_random.fa chr19_gl000208_random.fa chr19_gl000209_random.fa chr21_gl000210_random.fa chrUn_gl000211.fa chrUn_gl000212.fa chrUn_gl000213.fa 	chrUn_gl000214.fa chrUn_gl000215.fa chrUn_gl000216.fa chrUn_gl000217.fa chrUn_gl000218.fa chrUn_gl000219.fa chrUn_gl000220.fa chrUn_gl000221.fa chrUn_gl000222.fa chrUn_gl000223.fa chrUn_gl000224.fa chrUn_gl000225.fa chrUn_gl000226.fa chrUn_gl000227.fa chrUn_gl000228.fa chrUn_gl000229.fa chrUn_gl000230.fa chrUn_gl000231.fa chrUn_gl000232.fa chrUn_gl000233.fa chrUn_gl000234.fa chrUn_gl000235.fa chrUn_gl000236.fa chrUn_gl000237.fa chrUn_gl000238.fa chrUn_gl000239.fa chrUn_gl000240.fa chrUn_gl000241.fa chrUn_gl000242.fa chrUn_gl000243.fa chrUn_gl000244.fa chrUn_gl000245.fa chrUn_gl000246.fa chrUn_gl000247.fa chrUn_gl000248.fa chrUn_gl000249.fa > hg19-bt2.fa
	
	d) moved individual fa files to Chr_and_rand_contig_hg19-bt
	e) samtools faidx hg19-bt2.fa (will generate hg19-bt2.fa.fai

	f) copied human Bowtie2Index/ to Bowtie2Index_hg19/ in /home/dballi/bin


