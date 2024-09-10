#!/bin/bash


# Author: Baylee Christensen
# Date: 9/6/24

# Recursively search all directories for fasta files, and count them
find . -type f -name "*.fasta" | wc -l | xargs >> log.txt

# Function to count sequences (which call two python function)
count_seq_bp() {
  local dir="$1"
  local seq_total_count=0
  local bp_total_count=0

  while read -r fasta_file; do
    # Count total sequences
    seq_count=$(python3 count_fasta_seq.py "$fasta_file")
    seq_total_count=$((seq_total_count + seq_count))

    # Count total bp
    bp_count=$(python3 count_bp.py "$fasta_file")
    bp_total_count=$((bp_total_count + bp_count))

  done < <(find "$dir" -type f -name "*.fasta")

  # Print the total sequence count and bp count, append to log
  echo "$seq_total_count" >> log.txt
  echo "$bp_total_count" >> log.txt
}

# Call function
count_seq_bp "/Users/bayleechristensen/OneDrive - Utah Tech University/School/FallClasses2024/s4b/02_shell_scripting"
