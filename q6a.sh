#!/bin/bash

args=$#
for i in `seq 1 $args`; do
	curr=$(eval echo \$$i)
	dup=$curr
	d=0
	while [ $dup -gt 0 ]; do
		d=$(($d+1))
		dup=$(($dup/10))
	done
	dup=$curr
	i=1
	sum=0
	while [ $i -le $d ]; do
                digit=$(($dup%10))
                dup=$(($dup/10))
		i=$(($i+1))
		sum=$(($sum+($digit**$d)))
        done
	if [ $sum -eq $curr ]; then
		echo "$curr is Armstrong"
	else
		echo "$curr is NOT Armstrong"
	fi
done
