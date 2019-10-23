#!/bin/bash

wget https://raw.githubusercontent.com/thomaskise/hello-nti-300/master/package/packages.txt     # get packages.txt from git

if [ -e /etc/packages.txt ]; then                                                               # check to see if packages.txt was not deleted
   rm -f /etc/packages.txt                                                                      # delete the file so that the new one gets installed
fi

mv packages.txt /etc/packages.txt                                                               # move the file to the appropriate directory

for packages in ($(cat /etc/packages.txt); do                                                   # for each package in the file, install it
  yum -y install $packages;
done

rm -f /etc/packages.txt                                                                         # delete the packages.txt file .. it's not needed anymore
