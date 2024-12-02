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

# Check for MD5 file
md5file="${filedir}/${name}_md5.txt"
if [ ! -f "$md5file" ]; then
    echo "MD5 file $md5file does not exist. Please check the file!"
    exit 1
fi

# Calculate current MD5
current_md5=$(md5sum "$filepath" | awk '{print $1}')

# Read stored MD5
stored_md5=$(cat "$md5file")

# Compare MD5 values
if [ "$current_md5" == "$stored_md5" ]; then
    echo "MD5 match!"
else
    echo "MD5 does not match!"
    echo "Current MD5: $current_md5"
    echo "Stored MD5: $stored_md5"
fi
