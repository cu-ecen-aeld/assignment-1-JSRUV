#!/bin/sh
# This script is called writer.sh and is located in the finder-app directory.
# Accepts the following runtime arguments:
# the first argument is a path to a directory on the filesystem, referred to below as files

writefile=$1

# the second argument is a text string which will be written to a file, referred to below as text
writestr=$2

# Check if both arguments are provided
if [ $# -lt 2 ]; then

    echo "Error: Missing arguments"
    echo "Usage: writer.sh <writefile> <writestr>"
    exit 1
fi      

# Exits with return value 1 error and print statements if any of the parameters above were not specified
if [ -z "$writefile" ] || [ -z "$writestr" ]; then

    echo "Error: Both parameters writefile and writestr  must be specified."
    exit 1
fi  

# Create the directory path if it doesn't exist
mkdir -p "$(dirname "$writefile")"

# Write the string, overwriting any existing file
echo "$writestr" > "$writefile"

# Exit 1 if the file could not be created
if [ ! -f "$writefile" ]; then
    echo "Error: Could not create file $writefile"
    exit 1
fi

exit 0