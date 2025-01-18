#!/bin/bash

# Write a shell script to find the number of files that are present in a directory and their names. Store the output in a file and display it.

# Assuming current directory and assuming only files and not directories to be counted
result=$(ls -p | grep -v '/')

echo "Number of files = $(echo $result | tr ' ' '\n' | wc --lines)" | tee q9a_output.txt

echo "Names of the files: " | tee -a q9a_output.txt
echo $result | tr ' ' '\n' | tee -a q9a_output.txt

echo "Output stored in file q9a_output.txt"
