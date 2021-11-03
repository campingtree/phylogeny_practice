#!/bin/sh

# Sort the input genomes in decreasing order of length
perl ../gclust/script/sortgenome.pl --genomes-file ../2/complete_seqdump.fasta --sortedgenomes-file ./sorted_complete_seqdump.fasta

# Cluster with gclust at 97 identity cut-off
../gclust/./gclust -nuc -threads 8 -ext 1 -sparse 2 -memiden 97 sorted_complete_seqdump.fasta > clustered_sorted_complete_seqdump.fasta

# Extract representitives from initial set
make -f ../gclust/script/makefile_createreps gf=../2/complete_seqdump.fasta clu=clustered_sorted_complete_seqdump.fasta pgf=representatives.fasta CRG
