#!/bin/bash

# Write a shell script to display the processes which are sleeping the status of the processes is S

echo "The processes which are sleeping are: "
ps axo stat,pid | tr -s ' ' ',' | grep 'S' | tr ',' '\t'
