#!/bin/bash

if [ -z "$1" ] ; then                                                                                                         # check for input argument; end script if none provided
  echo "you didn't provide an argument"
  exit 0;
else                                                                                    
  echo "Here is the list of " $# " argument(s) that were entered:"                                                            # message the number of arguments entered
  for input in "$@"                                                                                                           # define loop condition
  do                                                                                                                          # lopp through the arguments
    echo $input                                                                                                               # output it to the screen
  done                                                                                                                        # end of for loop
fi

for input in "$@"                                                                                                             # set for loop condition
do                                                                                                                            # loop through and process all arguments provided

   test_package=$( rpm -q $input | grep "not installed"  )                                                                    # get current package status 

   if [ ! -z "$test_package" ] ; then                                                                                         # if current package is installed
     echo $input "package is not installed"                                                                                   # output status message - not installed
     read -p "Install? (Y/N): " confirm && [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]] || exit 0                       # prompt then continue if condition if y or yes entered (case agnostic); else exit script
     yum -y install $input                                                                                                    # install
   else 
     echo $input "package is installed"                                                                                       # if package is installed echo confirmation
   fi                                                                                                                         # closes the if/else statment

   status=$(systemctl status $input | grep Active | awk '{print $2}')                                                         # get the status of the current package
   inactive="inactive"                                                                                                        # set a var for inactive status

   if [ "$status" == "$inactive" ]; then                                                                                      # if the status is inactive execute the next statments
      echo "noooooooooo it is off"                                                                                            # oh no .... a  little levity
      read -p "Do you want to turn is on? (Y/N): " confirm && [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]] || exit 0    # prompt then continual if condition if y or yes (case agnostic)
      systemctl start $input                                                                                                  # turn on package
      echo $input " was started."                                                                                             # message start
      echo $input " is ready to go."
   else                                                                                                                       # if status is active
      echo "All is good"                                                                                                      # message that all is good
   fi                                                                                                                         # close if/else

done                                                                                                                          # done with for loop
