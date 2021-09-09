#!/bin/bash

#SBATCH --account=bgmp
#SBATCH --partition=bgmp
#SBATCH --cpus-per-task=8
#SBATCH --nodes=1
#SBATCH --time=1-0:00:00

conda activate QAA

/usr/bin/time -v htseq-count -s yes \
aligned/27_4C_mbnl_S19_L008_Aligned.sorted.sam mus/Mus_musculus.GRCm39.104.gtf \
> aligned/27_4C_mbnl_S19_L008.stranded.genecount

/usr/bin/time -v htseq-count -s no \
aligned/27_4C_mbnl_S19_L008_Aligned.sorted.sam mus/Mus_musculus.GRCm39.104.gtf \
> aligned/27_4C_mbnl_S19_L008.unstranded.genecount

/usr/bin/time -v htseq-count -s yes \
aligned/28_4D_mbnl_S20_L008_Aligned.sorted.sam mus/Mus_musculus.GRCm39.104.gtf \
> aligned/28_4D_mbnl_S20_L008.stranded.genecount

/usr/bin/time -v htseq-count -s no \
aligned/28_4D_mbnl_S20_L008_Aligned.sorted.sam mus/Mus_musculus.GRCm39.104.gtf \
> aligned/28_4D_mbnl_S20_L008.unstranded.genecount

exit