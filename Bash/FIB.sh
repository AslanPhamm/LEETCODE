#!/bin/bash
n="$1"
k="$2"
# Assign the varriables
Fibo[1]=1
Fibo[2]=1
# Use for loop to print the first n Fibonacci numbers
for ((i=3; i<=n; i++)); do
# Conducting the calculation
    Fibo[$i]=$((Fibo[i-1] + k*Fibo[i-2]))    
    echo "${Fibo[@]}"
done