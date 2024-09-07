#!/bin/bash


# Author: Baylee Christensen
# Date: 9/6/24

# Recursively search all directories for fasta files, and count them
find . -type f -name "*.fasta" | wc -l >>log.txt

# Function to count sequences (which calls a python function)
count_sequences() {
  local dir="$1"
  local total_count=0

  # Use process substitution to avoid subshell issues
  while read -r fasta_file; do
    count=$(python3 count_fasta_seq.py "$fasta_file")

    # Add the sequence count to the total count
    total_count=$((total_count + count))

  done < <(find "$dir" -type f -name "*.fasta")  # Use process substitution here

  # Print the total sequence count
  echo "$total_count"
}

# Call function
count_sequences "/Users/bayleechristensen/OneDrive - Utah Tech University/School/FallClasses2024/s4b/02_shell_scripting"
