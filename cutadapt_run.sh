#!/bin/bash

#SBATCH --account=bgmp
#SBATCH --partition=bgmp
#SBATCH --cpus-per-task=1
#SBATCH --time=1-0:00:00

conda activate QAA

in_dir=/projects/bgmp/shared/2017_sequencing/demultiplexed
out_dir=/projects/bgmp/sgrindst/bioinformatics/Bi623/QAA/cutadapt

/usr/bin/time -v cutadapt -a AGATCGGAAGAGCACACGTCTGAACTCCAGTCA -A AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT \
-o $out_dir/27_4C_mbnl_S19_L008_R1_001.adaptertrimmed.fastq.gz \
-p $out_dir/27_4C_mbnl_S19_L008_R2_001.adaptertrimmed.fastq.gz \
$in_dir/27_4C_mbnl_S19_L008_R1_001.fastq.gz $in_dir/27_4C_mbnl_S19_L008_R2_001.fastq.gz

/usr/bin/time -v cutadapt -a AGATCGGAAGAGCACACGTCTGAACTCCAGTCA -A AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT \
-o $out_dir/28_4D_mbnl_S20_L008_R1_001.adaptertrimmed.fastq.gz \
-p $out_dir/28_4D_mbnl_S20_L008_R2_001.adaptertrimmed.fastq.gz \
$in_dir/28_4D_mbnl_S20_L008_R1_001.fastq.gz $in_dir/28_4D_mbnl_S20_L008_R2_001.fastq.gz

exit