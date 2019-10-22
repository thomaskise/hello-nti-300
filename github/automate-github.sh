#!/bin/bash
if [ -e /bin/git ]; then                                                   # check to see if httpd has already been installled
#@if [ ! -e /bin/git ]; then  (not)                                        # check to see if httpd has already been installled
   exit 0;                                                                 # exit if it has, because the environment is already installed
fi

yum -y install git;                                                        # install git
mkdir /repos                                                               # make a directory to store repos
cd /repos                                                                  # change to the repo directory
git config --global user.name "Duck9000"                                   # update global user name
git config --global user.email thomas.harrington@seattlecentral.edu        # update global email address
git clone https://github.com/thomaskise/hello-nti-300.git  /repos          # clone hello-nti-300 

