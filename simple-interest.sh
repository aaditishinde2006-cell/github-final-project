
#!/bin/bash

# Simple Interest Calculator

echo "===== Simple Interest Calculator ====="

read -p "Enter principal amount: " principal
read -p "Enter annual interest rate (%): " rate
read -p "Enter time in years: " time

if ! [[ "$principal" =~ ^[0-9]+([.][0-9]+)?$ ]] ||
   ! [[ "$rate" =~ ^[0-9]+([.][0-9]+)?$ ]] ||
   ! [[ "$time" =~ ^[0-9]+([.][0-9]+)?$ ]]; then
    echo "Error: Please enter valid non-negative numbers."
    exit 1
fi

interest=$(awk -v p="$principal" -v r="$rate" -v t="$time" \
    'BEGIN { printf "%.2f", (p * r * t) / 100 }')

echo "-----------------------------------"
echo "Principal Amount: $principal"
echo "Annual Rate:      $rate%"
echo "Time:             $time years"
echo "Simple Interest:  $interest"
echo "-----------------------------------"
