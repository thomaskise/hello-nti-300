#! /bin/bash

yum -y install httpd mod_ssl                                                                           # install apache and SSL support
yum -y install wget                                                                                    # install wget - assume 'yes'

# set-up cron job
wget https://raw.githubusercontent.com/thomaskise/hello-nti-300/master/startup/automate-apache.sh     # get cronjob script from github
chmod +x automate-apache.sh                                                                           # make script executable
./automate-apache.sh                                                                                  # run the script
rm -f automate-apache.sh                                                                              # delete the script

systemctl start httpd