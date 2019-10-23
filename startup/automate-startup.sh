#! /bin/bash
# paste this script into environment startup script. Everything else is external

yum -y install wget                                                                                    # install wget - assume 'yes'

# set up custom.sh
if [ -e /etc/profile.d/custom.sh ]; then                                                               # check to see if custom.sh has already been installled
   rm -f /etc/profile.d/custom.sh                                                                      # delete the script so that the new one gets installed
fi

wget https://raw.githubusercontent.com/thomaskise/hello-nti-300/master/startup/custom.sh               # get custom.sh script from github
mv custom.sh  /etc/profile.d/custom.sh                                                                 # move custom.sh to where it will be executed during startup
chmod +x /etc/profile.d/custom.sh                                                                      # make script executable
/etc/profile.d/custom.sh                                                                               # run the script jic it's missed (won't execute with leading period)


wget https://raw.githubusercontent.com/thomaskise/hello-nti-300/master/startup/automate-apache.sh      # get apache script from github
chmod +x automate-apache.sh                                                                            # make script executable
./automate-apache.sh                                                                                   # run the script
rm -f automate-apache.sh                                                                               # delete the script

systemctl start httpd                                                                                  # start httpd service