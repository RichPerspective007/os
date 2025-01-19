#!/bin/bash

while read -r line; do
	marks=$(cut -d ',' <<< $line -f3 | tr -d ' ')
	case $marks in
		100|9[0-9])
			echo "$line, O"
			;;
		8[0-9])
			echo "$line, E"
			;;
		7[0-9])
                        echo "$line, A"
                        ;;
		6[0-9])
                        echo "$line, B"
                        ;;
		5[0-9])
                        echo "$line, C"
                        ;;
		4[0-9])
                        echo "$line, D"
                        ;;
		[0-9]|[1-3][0-9])
                        echo "$line, F"
                        ;;
		*)
                        echo "$line, I"
                        ;;
	esac
done < q15a_input.txt
