#!/bin/bash

#SBATCH --account=bgmp
#SBATCH --partition=bgmp
#SBATCH --cpus-per-task=1
#SBATCH --time=1-0:00:00

#count the number of reads mapping to a feature and the total reads (using htseq-count output) in order to
#determine whether the data is stranded or unstranded

#commands are taken from my ICA4 GitHub markdown file from Bi621

echo '27_4C_mbnl_S19_L008.stranded.genecount:' > aligned/htseq_count_stats.txt
echo 'reads mapping to feature:' >> aligned/htseq_count_stats.txt
grep -v '^_' aligned/27_4C_mbnl_S19_L008.stranded.genecount | awk '{sum+=$2}END{print sum}' >> aligned/htseq_count_stats.txt
echo 'total reads:' >> aligned/htseq_count_stats.txt
awk '{sum+=$2}END{print sum}' aligned/27_4C_mbnl_S19_L008.stranded.genecount >> aligned/htseq_count_stats.txt
echo '' >> aligned/htseq_count_stats.txt

echo '27_4C_mbnl_S19_L008.unstranded.genecount:' >> aligned/htseq_count_stats.txt
echo 'reads mapping to feature:' >> aligned/htseq_count_stats.txt
grep -v '^_' aligned/27_4C_mbnl_S19_L008.unstranded.genecount | awk '{sum+=$2}END{print sum}' >> aligned/htseq_count_stats.txt
echo 'total reads:' >> aligned/htseq_count_stats.txt
awk '{sum+=$2}END{print sum}' aligned/27_4C_mbnl_S19_L008.unstranded.genecount >> aligned/htseq_count_stats.txt
echo '' >> aligned/htseq_count_stats.txt

echo '28_4D_mbnl_S20_L008.stranded.genecount:' >> aligned/htseq_count_stats.txt
echo 'reads mapping to feature:' >> aligned/htseq_count_stats.txt
grep -v '^_' aligned/28_4D_mbnl_S20_L008.stranded.genecount | awk '{sum+=$2}END{print sum}' >> aligned/htseq_count_stats.txt
echo 'total reads:' >> aligned/htseq_count_stats.txt
awk '{sum+=$2}END{print sum}' aligned/28_4D_mbnl_S20_L008.stranded.genecount >> aligned/htseq_count_stats.txt
echo '' >> aligned/htseq_count_stats.txt

echo '28_4D_mbnl_S20_L008.unstranded.genecount:' >> aligned/htseq_count_stats.txt
echo 'reads mapping to feature:' >> aligned/htseq_count_stats.txt
grep -v '^_' aligned/28_4D_mbnl_S20_L008.unstranded.genecount | awk '{sum+=$2}END{print sum}' >> aligned/htseq_count_stats.txt
echo 'total reads:' >> aligned/htseq_count_stats.txt
awk '{sum+=$2}END{print sum}' aligned/28_4D_mbnl_S20_L008.unstranded.genecount >> aligned/htseq_count_stats.txt

exit