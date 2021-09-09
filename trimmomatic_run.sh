#!/bin/bash

#SBATCH --account=bgmp
#SBATCH --partition=bgmp
#SBATCH --cpus-per-task=1
#SBATCH --time=1-0:00:00

conda activate QAA

in_dir=/projects/bgmp/sgrindst/bioinformatics/Bi623/QAA/cutadapt
out_dir=/projects/bgmp/sgrindst/bioinformatics/Bi623/QAA/trimmed

/usr/bin/time -v trimmomatic PE -phred33 \
$in_dir/27_4C_mbnl_S19_L008_R1_001.adaptertrimmed.fastq.gz \
$in_dir/27_4C_mbnl_S19_L008_R2_001.adaptertrimmed.fastq.gz \
$out_dir/27_4C_mbnl_S19_L008_R1_001.trimmed.paired.fastq.gz \
$out_dir/27_4C_mbnl_S19_L008_R1_001.trimmed.unpaired.fastq.gz \
$out_dir/27_4C_mbnl_S19_L008_R2_001.trimmed.paired.fastq.gz \
$out_dir/27_4C_mbnl_S19_L008_R2_001.trimmed.unpaired.fastq.gz \
LEADING:3 TRAILING:3 SLIDINGWINDOW:5:15 MINLEN:35

/usr/bin/time -v trimmomatic PE -phred33 \
$in_dir/28_4D_mbnl_S20_L008_R1_001.adaptertrimmed.fastq.gz \
$in_dir/28_4D_mbnl_S20_L008_R2_001.adaptertrimmed.fastq.gz \
$out_dir/28_4D_mbnl_S20_L008_R1_001.trimmed.paired.fastq.gz \
$out_dir/28_4D_mbnl_S20_L008_R1_001.trimmed.unpaired.fastq.gz \
$out_dir/28_4D_mbnl_S20_L008_R2_001.trimmed.paired.fastq.gz \
$out_dir/28_4D_mbnl_S20_L008_R2_001.trimmed.unpaired.fastq.gz \
LEADING:3 TRAILING:3 SLIDINGWINDOW:5:15 MINLEN:35

exit