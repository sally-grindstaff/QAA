#!/bin/bash

#SBATCH --account=bgmp
#SBATCH --partition=bgmp
#SBATCH --cpus-per-task=1
#SBATCH --time=1-0:00:00

conda activate bgmp_py39

/usr/bin/time -v ./qual_scores.py -i /projects/bgmp/shared/2017_sequencing/demultiplexed/27_4C_mbnl_S19_L008_R1_001.fastq.gz -o 27_4C_mbnl_S19_L008_R1_001 -l 101

exit