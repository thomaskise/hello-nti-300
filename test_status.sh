#!/bin/bash

if [ -z "$1" ]; then    # check to see if the var is set
	exit 0;
fi

varname=$( systemctl status $1 | grep Active | awk ‘{print $2}’); 
varname2="inactive"; 

if [ $varname == $varname2 ]; then 
  echo "Nooooooo! it is off"; 
fi
