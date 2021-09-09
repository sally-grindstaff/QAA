#!/bin/bash

#SBATCH --account=bgmp
#SBATCH --partition=bgmp
#SBATCH --cpus-per-task=8
#SBATCH --nodes=1
#SBATCH --time=1-0:00:00

conda activate QAA

in_dir=/projects/bgmp/sgrindst/bioinformatics/Bi623/QAA/trimmed

/usr/bin/time -v STAR --runThreadN 8 --runMode alignReads \
--outFilterMultimapNmax 3 \
--outSAMunmapped Within KeepPairs \
--alignIntronMax 1000000 --alignMatesGapMax 1000000 \
--readFilesCommand zcat \
--readFilesIn $in_dir/27_4C_mbnl_S19_L008_R1_001.trimmed.paired.fastq.gz $in_dir/27_4C_mbnl_S19_L008_R2_001.trimmed.paired.fastq.gz \
--genomeDir Mus_musculus.GRCm39.dna.ens104.STAR_2.7.9a \
--outFileNamePrefix 27_4C_mbnl_S19_L008_

/usr/bin/time -v STAR --runThreadN 8 --runMode alignReads \
--outFilterMultimapNmax 3 \
--outSAMunmapped Within KeepPairs \
--alignIntronMax 1000000 --alignMatesGapMax 1000000 \
--readFilesCommand zcat \
--readFilesIn $in_dir/28_4D_mbnl_S20_L008_R1_001.trimmed.paired.fastq.gz $in_dir/28_4D_mbnl_S20_L008_R2_001.trimmed.paired.fastq.gz \
--genomeDir Mus_musculus.GRCm39.dna.ens104.STAR_2.7.9a \
--outFileNamePrefix 28_4D_mbnl_S20_L008_

exit