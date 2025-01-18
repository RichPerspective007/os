#!/bin/bash

# Write a shell script to find the number of characters, words and lines in a set of files given by the user through the command line argument

number_of_files=$#
fno=1

while [ $fno -le $number_of_files ]; do
	fname=$(eval echo \$$fno)
	echo "File name: $fname"
	echo "Characters: $(wc --chars $fname | cut -d ' ' -f1)"
	echo "Words: $(wc --words $fname | cut -d ' ' -f1)"
	echo "Lines: $(wc --lines $fname | cut -d ' ' -f1)"
	echo ''
	fno=$(($fno+1))
done
