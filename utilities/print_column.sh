#!/bin/bash
: '
print_column.sh version 1.0

This script will parse the requested field out of a file
Two arguments are expected. The first is the file name, and the second is the field number

The current version expects a space for the field delimiter.
'

if [ -z "$1" ] ; then                               # check for input argument; end s
cript if none provided
  echo "you didn't provide an argument"
  exit 0;
fi

filename=$1                                         # assign var for argument 1
field="f"$2                                         # assign var for argument 2
echo $($filename | cut -d' ' -$field)               # output the text for the requested field