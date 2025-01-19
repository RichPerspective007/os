#!/bin/bash

# Write a script to check if a given date is valid or not.

echo "Correct date formats: MM/DD/YY or MM/DD/YYYY or date month, year or month date, year"
echo "Enter date: "
read d

date --date=$(echo $d)
