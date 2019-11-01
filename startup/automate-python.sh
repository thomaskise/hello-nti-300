#! /bin/bash

echo "starting automate-apache.sh" | logger

# get and run custom.sh to install custom functions and aliases
if [ -e /etc/profile.d/custom.sh ]; then                                                                   # check to see if custom.sh has already been installled
   rm -f /etc/profile.d/custom.sh                                                                          # delete the script so that the new one gets installed
fi

wget https://raw.githubusercontent.com/thomaskise/hello-nti-300/master/startup/custom.sh                   # get custom.sh script from github
mv custom.sh  /etc/profile.d/custom.sh                                                                     # move custom.sh to where it will be executed during startup
chmod +x /etc/profile.d/custom.sh                                                                          # make script executable
#source /etc/bashrc                                                                                         # run /etc/bashrc which executes the script

# get django.py and run it to set up packages
wget https://raw.githubusercontent.com/thomaskise/hello-nti-300/master/django/django.py                    # get django script from github
chmod +x django.py                                                                                         # make script executable
./django.py                                                                                                # run the script
rm -f django.py                                                                                            # delete the script

# set up git and clone the repo
wget https://raw.githubusercontent.com/thomaskise/hello-nti-300/master/github/automate-github.sh           # get github script from github
chmod +x automate-github.sh                                                                                # make script executable
./automate-github.sh                                                                                       # run the script
rm -f automate-github.sh                                                                                   # delete the script