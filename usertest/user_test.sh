#!/bin/bash

if [ -z "$1" ] ; then
  echo "you didn't provide an argument"
  exit 0;
fi

input="$1";

# parse argument place in var

test_package=$(yum search installed | grep "$input" ) 

if [ -z "$test_package"]; then #my comment here
             ;    #prompt for input
else 
  echo "Package is installed";
fi                      # closes the if statment

