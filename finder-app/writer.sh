#!/bin/sh
# This script is called writer.sh and is located in the finder-app directory.
# Accepts the following runtime arguments:
# the first argument is a path to a directory on the filesystem, referred to below as files
dir=$1

# the second argument is a text string which will be written to a file, referred to below as text
text=$2

# Check if both arguments are provided
if [ $# -lt 2 ]; then

    echo "Error: Missing arguments"
    echo "Usage: writer.sh <dir> <text>"
    exit 1
fi      

# Exits with return value 1 error and print statements if any of the parameters above were not specified
if [ -z "$dir" ] || [ -z "$text" ]; then

    echo "Error: Both parameters dir and text must be specified."
    exit 1
fi  
