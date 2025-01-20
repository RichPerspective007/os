#!/bin/bash

echo "Total number of files in current directory (including directory files): $(ls -1 | wc --lines)"
echo "Largest file in current directory (including directory files): $(ls -1S | head -n 1)"
