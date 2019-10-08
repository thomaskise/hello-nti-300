yum -y install httpd mod_ssl                                                                    # install apache and SSL support
systemctl start httpd                                                                           # start apache

sed -i 's/^/#/g' /etc/httpd/conf.d/welcome.conf                                                 # comment out the welcome page



echo "#!/bin/bash
time=$(date)
<html><body><h1>hi there, it is $time, how are you?</h1></body></html>" > /var/www/html/index.html  # create custom welcome page file that cron will run

chmod +x updating_webpage.sh                                                                    # change permissions on file to make executable

echo "# ┌───────────── minute (0 - 59)
# │ ┌───────────── hour (0 - 23)
# │ │ ┌───────────── day of the month (1 - 31)
# │ │ │ ┌───────────── month (1 - 12)
# │ │ │ │ ┌───────────── day of the week (0 - 6) (Sunday to Saturday;
# │ │ │ │ │                                   7 is also Sunday on some systems)
# │ │ │ │ │
# │ │ │ │ │
# * * * * * command to execute
*/5 * * * * /bin/echo 'I/'m running updating_webpage.sh' | logger                      # enter log every 5 minutes
*/5 * * * * /root/updating_webpage.sh                                                 # run job every 5 minutes" >


systemctl restart httpd                                                                         # restart apache 


#   cd ~
#     2  cd ../../..
#     3  yum install httpd
#     4  vim updating_webpage.sh
#     5  chmod +x updating_webpage.sh
#     6  ls - l
#     7  ./updating_webpage.sh
#     8  vim updating_webpage.sh
#     9  sed -i 's/^/#/g' /etc/httpd/conf.d/welcome.conf                                                 # comment out the welcome page
#    10  systemctl restart httpd
#    11  systemctl restart httpd
#    12  ./updating_webpage.sh
