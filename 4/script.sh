#!/bin/sh

# Translate aligned DNR/RNR sequences to protein sequences with seqkit
../seqkit translate aligned_parts.fasta > translated_aligned_parts.fasta

# Filter protein sequences shorter than 800
../seqkit seq -m 800 translated_aligned_parts.fasta > filtered_translated_aligned_parts.fasta

# Align with mafft
mafft --maxiterate 1000 --localpair filtered_translated_aligned_parts.fasta > mafft_aligned_parts.fasta

# Do some simplification (remove spaces, remove query symbols...)

# Generate tree with fasttree
fasttree -gamma mafft_aligned_parts.fasta > tree.txt

# Render tree graphically (newick format) (or just display it with eye3 in step 5...)
http://etetoolkit.org/treeview/
