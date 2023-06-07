#!/bin/bash

# Check if the required parameters are specified
if [ $# -ne 2 ]; then
    echo "Error: Missing parameters."
    exit 1
fi

# Get the file path and text string from arguments
writefile="$1"
writestr="$2"

# Create the directory path if it doesn't exist
mkdir -p "$(dirname "$writefile")"

# Write the content to the file
echo "$writestr" > "$writefile"

# Check if the file was created successfully
if [ $? -ne 0 ]; then
    echo "Error: Failed to create the file."
    exit 1
fi

# Print success message
echo "File created: $writefile"
echo "Content:"
cat "$writefile"

