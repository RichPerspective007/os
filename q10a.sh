#!/bin/bash

# In an input file, there are some student records (Roll | Name | Marks). Find the student name and roll number of the student who gets the heighest marks

max=-1
currmaxroll=-1
currmaxname=""
while read -r line; do
	curr=$(cut -d '|' <<< $line -f3 | tr -d ' ') # deleting any trailing spaces from the number for numeric comparison
	if [ $curr -gt $max ]; then
		max=$curr
		currmaxroll=$(cut -d '|' <<< $line -f1 | tr -d ' ')
		currmaxname=$(cut -d '|' <<< $line -f2)
	fi	
done < q10a_input.txt

echo "Highest Marks = $max"
echo "Roll number: $currmaxroll"
echo "Name of the student: $currmaxname"

# Change the input file records and values as per wish to test the script
