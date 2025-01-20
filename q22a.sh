#!/bin/bash

argc=$#
argv=1

while [ $argv -le $argc ]; do
	fn=$(eval echo \$$argv)
	if [ ! -e "$fn" ]; then
		argv=$(($argv+1))
		echo "$fn - No such file or directory"
		continue
	fi
	if [ -d "$fn" ]; then
		echo "$fn is a directory."
	fi
	if [ -f "$fn" ]; then
		echo -e "File name: $fn\nNumber of lines: $(wc --lines $fn)\nNumber of words: $(wc --words $fn)"
	fi
	permissions=$(ls -ld $fn | cut -d ' ' -f1)
	grep -E --quiet '^.{5}w.{4}$' <<< "$permissions"	
	if [ $? -eq 0 ]; then
		echo -e "$fn has group write permission so permission is being revoked.\n"
		chmod g-w $fn
	else
		echo -e "$fn does not have group write permission so it is being given the same.\n"
		chmod g+w $fn
	fi
	argv=$(($argv+1))
done
