#! /bin/bash
if [ -e /usr/sbin/httpd ]; then                                                                        # check to see if httpd has already been installled
   exit 0;                                                                                             # exit if it has, because the environment is already installed
fi

#yum -y install httpd mod_ssl                                                                           # install apache and SSL support
yum -y install wget                                                                                    # install wget - assume 'yes'

# set-up apache
wget https://raw.githubusercontent.com/thomaskise/hello-nti-300/master/startup/automate-apache.sh      # get apache script from github
chmod +x automate-apache.sh                                                                            # make script executable
./automate-apache.sh                                                                                   # run the script
rm -f automate-apache.sh                                                                               # delete the script

systemctl start httpd                                                                                  # start httpd service