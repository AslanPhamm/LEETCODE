#!/bin/bash
# DNA sequence
DNA="$1"
# Count the occurrences of each nucleotide
A=$(echo "$DNA" | grep -o "A" | wc -l)
T=$(echo "$DNA" | grep -o "T" | wc -l)
C=$(echo "$DNA" | grep -o "C" | wc -l)
G=$(echo "$DNA" | grep -o "G" | wc -l)
# Print the counts
echo "$A $C $G $T"