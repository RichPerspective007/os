#!/bin/bash


# Two implementations one using the regex used in switch-case structure, second using numeric range which does not work well with incomplete result indicator "---". Use numeric indicator like -1 for incomplete

while read -r line; do
	marks=$(cut -d ',' <<< $line -f3 | tr -d ' ')
		
	if [[ $marks =~ ^100|9[0-9]$ ]]; then
	#if [ $marks -ge 90 ] && [ $marks -le 100 ]; then 
		echo "$line, O"
	elif [[ $marks =~ ^8[0-9]$ ]]; then
	#elif [ $marks -ge 80 ] && [ $marks -le 89 ]; then
		echo "$line, E"
	elif [[ $marks =~ ^7[0-9]$ ]]; then
	#elif [ $marks -ge 70 ] && [ $marks -le 79 ]; then
                echo "$line, A"
	elif [[ $marks =~ ^6[0-9]$ ]]; then
	#elif [ $marks -ge 60 ] && [ $marks -le 69 ]; then
                echo "$line, B"             
	elif [[ $marks =~ ^5[0-9]$ ]]; then
	#elif [ $marks -ge 50 ] && [ $marks -le 59 ]; then
                echo "$line, C"
	elif [[ $marks =~ ^4[0-9]$ ]]; then
	#elif [ $marks -ge 40 ] && [ $marks -le 49 ]; then
                echo "$line, D"
	elif [[ $marks =~ ^[0-9]|[1-3][0-9]$ ]]; then
	#elif [ $marks -ge 0 ] && [ $marks -le 39 ]; then
                echo "$line, F"
	else        
		echo "$line, I"
	fi
done < q18a_input.txt
