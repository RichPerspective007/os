#!/bin/bash

while read -r line; do
	echo $line
done < q32a_input.txt

# user input roll number
echo "Enter roll number of student record to be updated"

read roll

# new marks input

echo "Enter updated marks"

read marks

awk -v m=$marks -v r=$roll '
BEGIN{ 
	FS=", "
}
{
	if ($1 == r){
		printf "%s,%s,%s\n", $1, $2, m
	}
	else {
		printf "%s,%s,%s\n", $1, $2, $3
	}
}' q32a_input.txt > q32a_output.txt
