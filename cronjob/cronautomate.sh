yum -y install httpd mod_ssl                                                                               # install apache and SSL support
yum install wget                                                                                           # install wget

# add crontab
wget https://raw.githubusercontent.com/thomaskise/hello-nti-300/master/cronjob/crontab                     # get the crontab file from github
mv -f crontab /var/spool/cron/root                                                                         # move crontab to the proper directory
crontab /var/spool/cron/root                                                                               # install crontab file

# add cronjob script
wget https://raw.githubusercontent.com/thomaskise/hello-nti-300/master/cronjob/updating_webpage.sh         # get the updating_webpage.sh file from github
mv -f updating_webpage.sh /root/updating_webpage.sh                                                        # move the updating_webpage.sh file to the proper directory

# update index page
time=$(date)                                                                                               # set the time varible for use in html statment
sed -i 's/^/#/g' /etc/httpd/conf.d/welcome.conf                                                            # comment out the welcome page
echo "<html><body><h1>hi there, it is $time, how are you?</h1></body></html>"  > /var/www/html/index.html  # create custom welcome page file that cron will run


systemctl start httpd                                                                                      # start apache
