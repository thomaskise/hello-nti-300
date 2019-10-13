# set-up index page and start apache
time=$(date)                                                                                               # set the time varible for use in html statment
sed -i 's/^/#/g' /etc/httpd/conf.d/welcome.conf                                                            # comment out the welcome page
echo "<html><body><h1>hi there, it is $time, how are you?</h1></body></html>"  > /var/www/html/index.html  # create custom welcome page file that cron will run
