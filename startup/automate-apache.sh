#! /bin/bash

# set up custom.sh
wget https://raw.githubusercontent.com/thomaskise/hello-nti-300/master/startup/custom.sh               # get custom.sh script from github
mv custom.sh  /etc/profile.d/custom.sh                                                                 # move custom.sh to where it will be executed during startup
chmod +x /etc/profile.d/custom.sh                                                                      # make script executable
/etc/profile.d/custom.sh                                                                               # run the script jic it's missed (no dot to start)

yum -y install httpd mod_ssl                                                                           # install apache and SSL support

# set-up cron job
wget https://raw.githubusercontent.com/thomaskise/hello-nti-300/master/cronjob/automate-cronjob.sh     # get cronjob script from github
chmod +x automate-cronjob.sh                                                                           # make script executable
./automate-cronjob.sh                                                                                  # run the script
rm -f automate-cronjob.sh                                                                              # delete the script

# set up the index page
wget https://raw.githubusercontent.com/thomaskise/hello-nti-300/master/pagecontrols/automate-indexpage.sh     # get indexpage script from github
chmod +x automate-indexpage.sh                                                                         # make script executable
./automate-indexpage.sh                                                                                # run the script
rm -f automate-indexpage.sh                                                                            # delete the script

# set up git and clone the repo
wget https://raw.githubusercontent.com/thomaskise/hello-nti-300/master/github/automate-github.sh       # get github script from github
chmod +x automate-github.sh                                                                            # make script executable
./automate-github.sh                                                                                   # run the script
rm -f automate-github.sh                                                                               # delete the script

