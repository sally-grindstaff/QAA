#!/bin/bash

#SBATCH --account=bgmp
#SBATCH --partition=bgmp
#SBATCH --cpus-per-task=8
#SBATCH --nodes=1
#SBATCH --time=1-0:00:00

#sort sam files by name in order to run HTSeq-count later

conda activate QAA

/usr/bin/time -v samtools view -u aligned/27_4C_mbnl_S19_L008_Aligned.out.sam | \
samtools sort -n | \
samtools view -h -o aligned/27_4C_mbnl_S19_L008_Aligned.sorted.sam

/usr/bin/time -v samtools view -u aligned/28_4D_mbnl_S20_L008_Aligned.out.sam | \
samtools sort -n | \
samtools view -h -o aligned/28_4D_mbnl_S20_L008_Aligned.sorted.sam

exit