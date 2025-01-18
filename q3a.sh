#!/bin/bash

#Write a shell script to find the palindrome numbers from a list of numbers (Numbers should be taken as command line arguments)

argc=$#
i=1
while [ $i -le $argc ]; do
	arg=$(eval echo \$$i)
	i=$(($i+1))
	if [ $arg -lt 0 ]; then
		continue
	fi
	reversed=$(rev <<< $arg)
	if [ $arg == $reversed ]; then
		echo "$arg is a palindrome number"
	else
		echo "$arg is NOT a palindrome number"
	fi
done
