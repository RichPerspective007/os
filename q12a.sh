#!/bin/bash

# Write a shell script to collect n number of years from command line argument and calculates which years are leap years
# input - ./q12a.sh 1996 2023 2000 1900 1901


n=$#

i=1

while [ $i -le $n ]; do
	year=$(eval echo \$$i)
	if [ $(($year%4)) -eq 0 ]; then
		if [ $(($year%400)) -eq 0 ]; then
			echo "$year is a centurion leap year."
		elif [ $(($year%100)) -eq 0 ]; then
			echo "$year is NOT a leap year."
		else
			echo "$year is a leap year."
		fi
	else
		echo "$year is NOT a leap year."
	fi
	i=$(($i+1))
done
