#!/bin/bash

# Write a shell script to find out the palindrome word from a file (omit . or ; or , after the word)


# tr is translate. It can translate single characters to single characters. here single space, comma, dot and semi-colon are replaced with new-line character. The -s option squeezes multiple consecutive occurences of any of the characters , . space ; into a single occurence and then changes it to the new-line character.

cat q5a_input.txt | tr -s ' .,;' '\n' > formatted_input.txt

while read -r line; do
	reverse=$(rev <<< $line)
	if [ "$line" = "$reverse" ]; then
		echo $line
	fi
done < formatted_input.txt
