#!/bin/bash

if [ -z "$1" ] ; then
  echo "you didn't provide an argument"
  exit 0;
fi

input="$1";

# parse argument place in var

test_package=$(yum search installed | grep "$input" ) 

if [ -z "$test_package"]; then #my comment here
             ;    #prompt for input
else 
  echo "Package is installed";
fi                      # closes the if statment

: '
yum -y install "$input" mod-ssl                                                          # Install apache and SSL support
systemctl start httpd                                                                 # start apache
sed -i 's/^/#/g' /etc/httpd/conf.d/welcome.conf                                       # comment out the default welcome page
echo "<html><body><h1>Hi there NTI 300</h1><body></html>" >/var/www/html/index.html   # create custom welcome page
systemctl restart httpd                                                               # restart apache so our changes take effect



status=$(systemctl status $1 | grep Active | awk '{print $2}')
inactive="inactive"

if [ $status == $inactive ]; then
   echo "noooooooooo it is off"
else 
   echo "My status is $status"
fi


  chmod +x package_install_test.sh
  ./package_install_test.sh
  
  chmod +x package_on_test.sh
  ./package_on_test.sh
  '
