#!/bin/bash

#Write a shell script to calculate the value of the series: x + x^2/2! + x^4/4! ......

echo "Enter the value of x: "
read x
echo "Enter number of terms of the series: "
read n

loopvar=0
fact=1
factvar=0
sum=0.0
term=0.0
while [ $loopvar -lt $n ]; do
	term=$(echo "scale=2; $x^$factvar/$fact" | bc)
	echo $term
	sum=$(echo "$sum+$term" | bc)
	((loopvar++))
	factvar=$(($loopvar*2))
	fact=$(($fact*($factvar)*($factvar-1)))
	
done
echo "The value of the series is: $sum"
