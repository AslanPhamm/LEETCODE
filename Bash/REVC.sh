#!/bin/bash
s="$1"
# Reverse compliment of DNA sequence
sc=$(echo "$s" | tr "ACGT" "TGCA" | rev)
# Print the reverse complement
echo "$sc"