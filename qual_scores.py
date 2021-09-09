#!/usr/bin/env python

import argparse
import Bioinfo
from matplotlib import pyplot as plt
import gzip

def get_args():
    parser = argparse.ArgumentParser(description='Takes a zipped fastq file and outputs a png plot of the per-base quality score distribution for that file. Assumes Phred+33 encoding. Always outputs to folder command was run from.')
    parser.add_argument('-i', '--input',help='Path to input zipped fastq file',required=True)
    parser.add_argument('-o','--output',help='Desired name (not including .png and not including any directory names) of output png.',required=True)
    parser.add_argument('-l','--length',help='Read length', required=True, type=int)
    return parser.parse_args()

args = get_args()

def init_list(lst: list, read_length: int, value: float=0.0) -> list:
    '''This function takes an empty list and will populate it with
    the value passed in "value". If no value is passed, initializes list
    with 101 values of 0.0.'''
    for i in range(read_length):
        lst.append(value)
    return lst

def populate_list(file, read_length):
    """Takes a FASTQ file and returns a list in which each item is the total sum of Q scores across all reads for a base position. The index of the base position in the read matches the index of the sum in the list. Assumes all reads are the same length."""
    qscore_list = []
    qscore_list = init_list(qscore_list, read_length)
    with gzip.open(file, 'rt') as fh:
        num_lines = 0
        for line in fh:
            line = line.strip()
            num_lines += 1
            if num_lines % 4 == 0:
                i = 0
                for score in line:
                    qscore_list[i] += Bioinfo.convert_phred(score)
                    i += 1
        i = 0
        for score in qscore_list:
            qscore_list[i] = score/(num_lines/4)
            i +=1
    return qscore_list

read_list = populate_list(args.input, args.length)

def make_hist(some_list:list, name:str):
    plt.bar(range(len(some_list)), some_list)
    plt.xlabel('# Base Pair')
    plt.ylabel('Mean quality score')
    plt.title(f'Quality Score Distribution in {name}')
    plt.savefig(f'{name}_qscore_distribution.png')
    plt.close()

make_hist(read_list,args.output)
