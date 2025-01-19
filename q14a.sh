#/bin/bash

echo "Enter x: "
read x

echo -e "\nEnter n: "
read n

if [ $n -eq 1 ]; then
	res=$(echo "scale=2; 1+$x^2" | bc)
elif [ $n -eq 2 ]; then
	res=$(echo "scale=2; 1+$x/$n" | bc)
elif [ $n -eq 3 ]; then
	res=$(echo "scale=2; 1+2*$x" | bc)
elif [ $n -lt 1 ] || [ $n -gt 3 ]; then
	res=$(echo "scale=2; 1+$n*$x" | bc)
fi

echo -e "\nY(x=$x, n=$n) = $res"
