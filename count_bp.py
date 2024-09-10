import sys

def count_bp(fasta_file):
    count = 0
    with open(fasta_file, 'r') as f:
        for line in f:
            if not line.startswith(">"):
                 count += len(line.strip()) # Counts bp using len function
    return count

if __name__ == "__main__":
    fasta_file = sys.argv[1]
    bp_count = count_bp(fasta_file)
    print(bp_count)
