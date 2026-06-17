#!/bin/bash
# DNA sequence
t="$1"
# Transcribe DNA to RNA
u=$(echo "$t" | tr "T" "U")
# Print the RNA sequence
echo "$u"