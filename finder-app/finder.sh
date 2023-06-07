#!/bin/bash

# Check if the required parameters are specified
if [ $# -ne 2 ]; then
    echo "Error: Missing parameters."
    exit 1
fi

# Get the directory path and search string from arguments
filesdir="$1"
searchstr="$2"

# Check if filesdir exists and is a directory
if [ ! -d "$filesdir" ]; then
    echo "Error: $filesdir is not a directory."
    exit 1
fi

# Find the number of files and matching lines
num_files=$(find "$filesdir" -type f | wc -l)
num_lines=$(grep -r "$searchstr" "$filesdir" | wc -l)

# Print the results
echo "The number of files are $num_files and the number of matching lines are $num_lines"

