#!/bin/bash

if [ -z "$1" ]; then    # check to see if the var is set
	exit 0;
fi

status=$( systemctl status $1 | grep Active | awk '{print $2}')
inactive="inactive"

if [ $status == $inactive ]; then
  echo "Nooooooo! it is off";
fi
