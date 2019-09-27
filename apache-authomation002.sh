yum -y install httpd mod_ssl                                                                    # install apache and SSL support
systemctl start httpd                                                                           # start apache
sed -i 's/^/#/g' /etc/httpd/conf.d/welcome.conf                                                 # comment out the welcome page
echo "<html><body><h1>Hi there NTI 300</h1><br />
<a href="page2.html">See if you have permission for page 2</a>
</body></html>" > /var/www/html/index.html                                                      # create custom welcome page
echo "<html><body><h1>You made it to my page 2</h1></body></html>" > /var/www/html/page2.html   # create custom page2

touch /var/www/html/.htpasswd                                                                   # create the password file

echo '                                                                                              
thom:$apr1$fEy2hp9s$TMQCOlvtGZcoGvwbPEIdL/
nicole:$apr1$PUSCxuzg$aeA7lWE6hhtDt9T9QrePy0 ' > /var/www/html/.htpasswd                        # create users

touch > /var/www/html/.htaccess                                                                 # create htaccess file

echo '
AuthType Basic
AuthName "My Protected Area"
AuthUserFile /var/www/html/.htpasswd
Require valid-user' > /var/www/html/.htaccess                                                  # create restrictions

systemctl restart httpd                                                                        # restart apache 
