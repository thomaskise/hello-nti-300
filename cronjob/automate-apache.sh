#! /bin/bash

# set-up cron job
wget https://raw.githubusercontent.com/thomaskise/hello-nti-300/master/cronjob/automate-cronjob.sh     # get cronjob script from github
chmod +x automate-cronjob.sh                                                                           # make script executable
./automate-cronjob.sh                                                                                  # run the script
rm -f automate-cronjob.sh                                                                              # delete the script

# set up the index page and start apache
wget https://raw.githubusercontent.com/thomaskise/hello-nti-300/master/cronjob/automate-indexpage.sh   # get cronjob script from github
chmod +x automate-indexpage.sh                                                                         # make script executable
./automate-indexpage.sh                                                                                # run the script
rm -f automate-indexpage.sh                                                                            # delete the script

systemctl restart httpd                                                                                # restart apache
chmod +x updating_webpage.sh                                                                      # reapply permissions because environment is coming up with them not established
