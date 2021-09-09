#!/bin/bash

#SBATCH --account=bgmp
#SBATCH --partition=bgmp
#SBATCH --cpus-per-task=1
#SBATCH --time=1-0:00:00

module load fastqc/0.11.5

input_dir=/projects/bgmp/sgrindst/bioinformatics/Bi623/QAA/trimmed
output_dir=/projects/bgmp/sgrindst/bioinformatics/Bi623/QAA/trimmed_fastqc_output/

/usr/bin/time -v fastqc \
$input_dir/27_4C_mbnl_S19_L008_R1_001.trimmed.paired.fastq.gz \
$input_dir/27_4C_mbnl_S19_L008_R2_001.trimmed.paired.fastq.gz \
$input_dir/28_4D_mbnl_S20_L008_R1_001.trimmed.paired.fastq.gz \
$input_dir/28_4D_mbnl_S20_L008_R2_001.trimmed.paired.fastq.gz \
-o $output_dir

exit