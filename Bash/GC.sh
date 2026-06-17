#!/bin/bash
FASTA_DATA=$(cat "$1")

# 1. Assign variables
MAX_GC=0
MAX_HEADER=""

# 2. While loop
while IFS=$'\t' read -r header sequence; do

# 3. Adjust the sequence to be in 1 line
    seq=$(echo -n "$sequence" | tr -d '\n')

# 4. Calculate the GC content
    gc_count=$(echo -n "$seq" | tr -cd 'GC' | wc -m)
    total_count=${#seq}
    gc_pct=$(echo "scale=6; ($gc_count/$total_count) * 100" | bc)

# 5. Compare the GC content to find the maximum
    if (( $(echo "$gc_pct > $MAX_GC" | bc -l) )); then
        MAX_GC=$gc_pct
        MAX_HEADER=$header
    fi

done < <(echo "$FASTA_DATA" | awk '/>/ {printf("%s%s\t",(N==0?"":"\n"),$0); N++}
                                    !/>/ {printf("%s",$0)}
                                    END {print ""}')

echo "${MAX_HEADER#>}"
echo "$MAX_GC"