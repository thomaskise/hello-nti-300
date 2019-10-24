#! /bin/bash

echo "starting automate-apache.sh" | logger

# comment out this cond statement before restarting the envoiroment if you want to reinstall
#if [ -e /usr/sbin/httpd ]; then                                                                           # check to see if httpd has already been installled
#   exit 0;                                                                                                # exit if it has, because the environment is already installed
#fi

yum -y install httpd mod_ssl                                                                               # install apache and SSL support

# get and run custom.sh to install custom functions and aliases
if [ -e /etc/profile.d/custom.sh ]; then                                                                   # check to see if custom.sh has already been installled
   rm -f /etc/profile.d/custom.sh                                                                          # delete the script so that the new one gets installed
fi

wget https://raw.githubusercontent.com/thomaskise/hello-nti-300/master/startup/custom.sh                   # get custom.sh script from github
mv custom.sh  /etc/profile.d/custom.sh                                                                     # move custom.sh to where it will be executed during startup
chmod +x /etc/profile.d/custom.sh                                                                          # make script executable
#source /etc/bashrc                                                                                         # run /etc/bashrc which executes the script

# set-up cron job
wget https://raw.githubusercontent.com/thomaskise/hello-nti-300/master/cronjob/automate-cronjob.sh         # get cronjob script from github
chmod +x automate-cronjob.sh                                                                               # make script executable
./automate-cronjob.sh                                                                                      # run the script
rm -f automate-cronjob.sh                                                                                  # delete the script

# set up the index page
wget https://raw.githubusercontent.com/thomaskise/hello-nti-300/master/pagecontrols/automate-indexpage.sh  # get indexpage script from github
chmod +x automate-indexpage.sh                                                                             # make script executable
./automate-indexpage.sh                                                                                    # run the script
rm -f automate-indexpage.sh                                                                                # delete the script

# set up git and clone the repo
wget https://raw.githubusercontent.com/thomaskise/hello-nti-300/master/github/automate-github.sh           # get github script from github
chmod +x automate-github.sh                                                                                # make script executable
./automate-github.sh                                                                                       # run the script
rm -f automate-github.sh                                                                                   # delete the script

# get packageinstall.sh and run it to set up packages
wget https://raw.githubusercontent.com/thomaskise/hello-nti-300/master/package/packageinstall.sh           # get packages script from github
chmod +x packageinstall.sh                                                                                 # make script executable
./packageinstall.sh                                                                                        # run the script
rm -f packageinstall.sh                                                                                    # delete the script
