#!/bin/bash

#SBATCH --account=bgmp
#SBATCH --partition=bgmp
#SBATCH --cpus-per-task=1
#SBATCH --time=1-0:00:00

#determine the number of reads mapping and not mapping to reference

/usr/bin/time -v /projects/bgmp/sgrindst/bioinformatics/Bi621/PS/ps8-sally-grindstaff/sam_mapping_counter.py \
-f aligned/27_4C_mbnl_S19_L008_Aligned.out.sam > aligned/27_4C_mbnl_S19_L008_mapped_counts.txt

/usr/bin/time -v /projects/bgmp/sgrindst/bioinformatics/Bi621/PS/ps8-sally-grindstaff/sam_mapping_counter.py \
-f aligned/28_4D_mbnl_S20_L008_Aligned.out.sam > aligned/28_4D_mbnl_S20_L008_mapped_counts.txt