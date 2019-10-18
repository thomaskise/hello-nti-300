#!/bin/bash

if [ -z "$1" ] ; then
  echo "you didn't provide an argument"
  exit 0;
fi

input="$1";

# parse argument place in var

test_package=$(yum search installed | grep "$input" ) 

if [ -z "$test_package"]; then #my comment here
  echo $input "package is not installed"              #prompt for input
  read -p "Install? (Y/N): " confirm && [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]] || exit 0
  yum -y install $input                  
else 
  echo $input "package is not installed"              #prompt for input
fi                      # closes the if statment
status=$(systemctl status $input | grep Active | awk '{print $2}')
inactive="inactive"

if [ $status == $inactive ]; then
   echo "noooooooooo it is off"
   read -p "Do you want to turn is on? (Y/N): " confirm && [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]] || exit 0
else 
   echo "All is good"
fi


