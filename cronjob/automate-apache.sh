# installs
yum -y install httpd mod_ssl                                                                               # install apache and SSL support
yum install wget  -y                                                                                       # install wget - assume 'yes'

# set-up cron job
wget https://raw.githubusercontent.com/thomaskise/hello-nti-300/master/cronjob/automate-cronjob.sh         # get cronjob script from github
chmod +x automate-cronjob.sh                                                                               # make script executable
./automate-cronjob.sh                                                                                      # run the script
rm automate-cronjob.sh                                                                                     # delete the script

# set up the index page and start apache
wget https://raw.githubusercontent.com/thomaskise/hello-nti-300/master/cronjob/automate-indexpage.sh       # get cronjob script from github
chmod +x indexpage.sh                                                                                      # make script executable
./automate-indexpage.sh                                                                                    # run the script
rm automate-indexpage.sh                                                                                   # delete the script


systemctl start httpd                                                                                      # start apache
