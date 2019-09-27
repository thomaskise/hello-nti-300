yum -y install httpd mod_ssl                                                            # install apache and SSL support
systemctl start httpd                                                                   # start apache
sed -i 's/^/#/g' /etc/httpd/conf.d/welcome.conf                                         # comment out the welcome page
echo "<html><body><h1>Hi there NTI 300</h1></body></html>" > /var/www/html/index.html   # create custom welcome page
systemctl restart httpd                                                                 # restart apache 
