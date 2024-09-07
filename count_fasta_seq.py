import sys

def count_fasta_sequences(fasta_file):
    count = 0
    with open(fasta_file, 'r') as f:
        for line in f:
            if line.startswith(">"):
                count += 1
    return count

if __name__ == "__main__":
    fasta_file = sys.argv[1]
    sequence_count = count_fasta_sequences(fasta_file)
    print(sequence_count)

