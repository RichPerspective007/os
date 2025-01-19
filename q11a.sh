#!/bin/bash

# Write a shell script to select greatest and lowest numbers from a set of numbers which are present in a file.

nums=$(cat q11a_input.txt | tr ',' ' ' | wc --words)

max=$(cut -d ',' q11a_input.txt -f1)
min=$(cut -d ',' q11a_input.txt -f1)
i=2

while [ $i -le $nums ]; do
	curr=$(cut -d ',' q11a_input.txt -f$(echo $i))
	if [ $curr -gt $max ]; then
		max=$curr
	fi
	if [ $curr -lt $min ]; then
                min=$curr
        fi
	i=$(($i+1))
done

echo "Maximum of the set = $max"
echo "Minimum of the set = $min"
