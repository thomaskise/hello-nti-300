#! /bin/bash
# paste this script into environment startup script. Everything else is external

yum -y install wget                                                                                    # install wget - assume 'yes'

wget https://raw.githubusercontent.com/thomaskise/hello-nti-300/master/startup/automate-apache.sh      # get apache script from github
chmod +x automate-apache.sh                                                                            # make script executable
./automate-apache.sh                                                                                   # run the script
rm -f automate-apache.sh                                                                               # delete the script

systemctl start httpd                                                                                  # start httpd service