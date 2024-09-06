#!/bin/bash


# Author: Baylee Christensen
# Date: 9/6/24

# Recursively search all directories for fasta files, and count them
find . -type f -name "*fasta" | wc -l >>log.txt


