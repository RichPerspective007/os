#!/bin/bash

rm q19a_output.txt 2>/dev/null
while read -r line; do
	temp=$(cut -d ',' <<< $line -f2 | tr -d ' ')
	if [ $temp -lt 15 ]; then
		echo "$line, Very Cold" | tee -a q19a_output.txt
	elif [ $temp -ge 15 ] && [ $temp -lt 25 ]; then
		echo "$line, Cold" | tee -a q19a_output.txt
	elif [ $temp -ge 25 ] && [ $temp -lt 35 ]; then
                echo "$line, Hot" | tee -a q19a_output.txt
	elif [ $temp -ge 35 ]; then
                echo "$line, Very Hot" | tee -a q19a_output.txt
	fi
done < q19a_input.txt
