#! /bin/bash

# set-up cron job
wget https://raw.githubusercontent.com/thomaskise/hello-nti-300/master/cronjob/automate-cronjob.sh     # get cronjob script from github
chmod +x automate-cronjob.sh                                                                           # make script executable
./automate-cronjob.sh                                                                                  # run the script
rm -f automate-cronjob.sh                                                                              # delete the script

# set up the index page and start apache
wget https://raw.githubusercontent.com/thomaskise/hello-nti-300/master/pages/automate-indexpage.sh     # get indexpage script from github
chmod +x automate-indexpage.sh                                                                         # make script executable
./automate-indexpage.sh                                                                                # run the script
rm -f automate-indexpage.sh                                                                            # delete the script

# set up git and clone the repo
wget https://raw.githubusercontent.com/thomaskise/hello-nti-300/master/github/automate-github.sh       # get github script from github
chmod +x automate-github.sh                                                                            # make script executable
./automate-github.sh                                                                                   # run the script
rm -f automate-github.sh                                                                               # delete the script