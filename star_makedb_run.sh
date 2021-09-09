#!/bin/bash

#SBATCH --account=bgmp
#SBATCH --partition=bgmp
#SBATCH --cpus-per-task=8
#SBATCH --nodes=1
#SBATCH --time=1-0:00:00

conda activate QAA

/usr/bin/time -v STAR \
--runThreadN 8 \
--runMode genomeGenerate \
--genomeDir Mus_musculus.GRCm39.dna.ens104.STAR_2.7.9a \
--genomeFastaFiles /projects/bgmp/sgrindst/bioinformatics/Bi623/QAA/mus/Mus_musculus.GRCm39.dna.primary_assembly.fa \
--sjdbGTFfile /projects/bgmp/sgrindst/bioinformatics/Bi623/QAA/mus/Mus_musculus.GRCm39.104.gtf

exit