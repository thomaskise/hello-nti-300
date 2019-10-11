#!/bin/bash
if [ -e /usr/sbin/httpd ]; then                                                                 # check to see if httpd has already been installled
   exit 0;                                                                                      # exit if it has, because the environment is already installed
fi

yum -y install httpd mod_ssl                                                                    # install apache and SSL support
systemctl start httpd                                                                           # start apache
sed -i 's/^/#/g' /etc/httpd/conf.d/welcome.conf                                                 # comment out the welcome page

echo "<html><body><h1>Hi there NTI 300</h1><br />
<a href="page2.html">See if you have permission for page 2</a>
</body></html>" > /var/www/html/index.html                                                      # create custom welcome page

echo "<html><body><h1>You made it to my page 2</h1></body></html>" > /var/www/html/page2.html   # create custom page2

# extra credit
sed -i '151s/AllowOverride None/AllowOverride All/' /etc/httpd/conf/httpd.conf                  # allow htaccess

echo '                                                                                              
thom:$apr1$fEy2hp9s$TMQCOlvtGZcoGvwbPEIdL/
nicole:$apr1$PUSCxuzg$aeA7lWE6hhtDt9T9QrePy0 ' > /usr/local/etc/.htpasswd                       # create users

echo '
<FilesMatch "^page2\.html$">
AuthType Basic
AuthName "Mypassword"
AuthUserFile /usr/local/etc/.htpasswd
Require user thom nicole
</FilesMatch>' > /var/www/html/.htaccess                                                        # restrict page 2

systemctl restart httpd                                                                         # restart apache 
