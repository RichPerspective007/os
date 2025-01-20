#!/bin/bash

gcd(){
	local num1=$1
	local num2=$2
	min=$num1
	if [ $min -gt $num2 ]; then
		min=$num2
	fi
	i=1
	maxd=#i
	while [ $i -le $min ]; do
		if [ $(($num1%$i)) -eq 0 ] && [ $(($num2%$i)) -eq 0 ]; then
			maxd=$i
		fi
		i=$(($i+1))
	done
	echo $maxd
}

lcm() {
	ans=$(($1*$2/$(gcd $1 $2)))
	echo $ans
}

echo "Enter the two positive numbers seperated by a space: "
IFS=" " read -r num1 num2

gcd=$(gcd $num1 $num2)
lcm=$(lcm $num1 $num2)
echo "GCD of $num1 and $num2 is: $gcd"
echo "LCM of $num1 and $num2 is: $lcm"
