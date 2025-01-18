#!/bin/bash

# Write a shell script to calculate the first n numbers of fibonacci series i.e. 0 1 1 2 3 5 8 .... and store the result in an output file

echo "Enter number of terms n: "
read n

i=1
a=0
b=0
c=1

rm q4a_output.txt 2>/dev/null
while [ $i -le $n ]; do
	a=$(($b+$c))
	echo $b >> q4a_output.txt
	i=$(($i+1))
	b=$c
	c=$a
done

cat q4a_output.txt | tr '\n' ' ' > temp.txt
cat temp.txt > q4a_output.txt
rm temp.txt
echo "Output stored in file q4a_output.txt"
