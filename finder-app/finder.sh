#!/bin/sh
# This script is called finder.sh and is located in the finder-app directory.
#Accepts the following runtime arguments:
# the first argument is a path to a directory on the filesystem, referred to below as filesdir; 
filesdir=$1


# the second argument is a text string which will be searched within these files,
# referred to below as searchstr
searchstr=$2


# Check if both arguments are provided
if [ $# -lt 2 ]; then
    echo "Error: Missing arguments"
    echo "Usage: finder.sh <filesdir> <searchstr>"
    exit 1
fi


# Exits with return value 1 error and print statements if any of the parameters above were not specified
if [ -z "$filesdir" ] || [ -z "$searchstr" ]; then
    echo "Error: Both parameters filesdir and searchstr must be specified."
    exit 1
fi

if [ ! -d "$filesdir" ]; then
    echo "Error: $filesdir is not a directory."
    exit 1
fi

num_files=$(find "$filesdir" -type f | wc -l)
num_matches=$(grep -r -c "$searchstr" "$filesdir" | awk -F: '{ total += $2 } END { print total }')

echo "The number of files are $num_files and the number of matching lines are $num_matches"
