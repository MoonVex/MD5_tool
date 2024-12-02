#!/bin/bash

# Prompt for file path
read -p "Enter the file path: " filepath

# Check if file exists
if [ ! -f "$filepath" ]; then
    echo "File does not exist. Please check the path!"
    exit 1
fi

# Extract file name and directory
filename=$(basename -- "$filepath")
filedir=$(dirname -- "$filepath")
name="${filename%.*}"

# Calculate MD5 and save to output file
outputfile="${filedir}/${name}_md5.txt"
md5sum "$filepath" | awk '{print $1}' > "$outputfile"

echo "MD5 has been saved to $outputfile"
