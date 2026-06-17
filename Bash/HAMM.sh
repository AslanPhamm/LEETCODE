#!/bin/bash
t=$(head -n 1 "$1")
s=$(tail -n 1 "$1")
# Calculate length of the DNA sequence
len=${#s}
# Find the mutation in the DNA sequence when comarring with the reference
hamming_dist=0
# Use for loop
for (( i=0; i<len; i+=1 )) # from i=0 increase 1 to the length of the DNA
do
    # Get the character (1) at position i in both strings
    si=${s:$i:1}
    ti=${t:$i:1}
    # If si != ti, increase haming_dist by 1
    if [ "$si" != "$ti" ]; then
        hamming_dist=$((hamming_dist + 1))
    fi
done
# Print
echo "$hamming_dist"