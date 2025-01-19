#!/bin/bash

echo "Enter date of birth in dd/mm/yyyy format: "
read bday
IFS="/"
set $bday

d=$1
m=$2
y=$3

IFS=" "

bday=$(echo -e "$m/$d/$y")

today=$(date +"%m/%d/%Y" | date +%s)
bdayts=$(date -d $bday +%s)

if [ $bdayts -gt $today ]; then
	echo "Future date is invalid input"
	exit 1
fi

byear=$(date -d $bday +%Y)
days=$(($(date -d "12/31/$byear" +%-j)-$(date -d $bday +%-j)+$(date +%-j)))
echo $days

years=0
while [ $(($byear+1)) -lt $(date +%Y) ]; do
	byear=$(($byear+1))
	years=$(($years+1))
done
echo $years

if [ $days -ge 365 ]; then
	years=$(($years+1))
	days=$(($days-365))
fi

months=$(echo "scale=0; $days/30.436768" | bc)
days=$(echo "scale=0; ($days-$months*30.436768)/1" | bc)

echo "You are $years years, $months months, $days days old."
