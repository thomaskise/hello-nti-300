#! /bin/bash
# paste this script into environment startup script. Everything else is external

yum -y install httpd mod_ssl
yum -y install wget                                                                                    # install wget - assume 'yes'

wget https://raw.githubusercontent.com/thomaskise/hello-nti-300/master/startup/automate-python.sh      # get apache script from github
chmod +x automate-python.sh                                                                            # make script executable
./automate-python.sh                                                                                   # run the script
rm -f automate-python.sh                                                                               # delete the script

source /etc/bashrc                                                                                     # execute /etc/bashrc to install functions in /etc/profile.id/custom.sh
