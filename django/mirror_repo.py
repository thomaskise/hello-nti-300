#!/usr/bin/python

import os                                                                                           # adds access to os.system
import subprocess                                                                                   # allows you to spawn new processes, connect to their input/output/error pipes, and obtain their return codes
import re

def install_nginx():
    print ('******************** step 1 - install Nginx Web Server')
    # installing Nginx HTTP server from the EPEL repository using the YUM package manager as follows
    os.system ('yum -y install epel-release')
    os.system ('yum -y install nginx')

    # start and enable ngix
    os.system ('systemctl start nginx')
    os.system ('systemctl enable nginx')

    # set server firewalls for http & https - open port 80 (http) and port 443 (https)
    os.system('firewall-cmd --zone=public --permanent --add-service=http')
    os.system('firewall-cmd --zone=public --permanent --add-service=https')
    os.system('firewall-cmd --reload')

def create_local_repo():
    # ******************** step 2 - Create yum local repo
    # install the required packages for creating, configuring and managing your local repository
    os.system('yum -y install createrepo  yum-utils')

    # create a directory to store packages and related files
    os.system('mkdir -p /var/www/html/repos/epel')

    # synch the CentOS YUM repositiories to the local directory

    # sync the repo with the CentOS YUM repo
    os.system('reposync -g -l -d -m --repoid=epel --newest-only --download-metadata --download_path=/var/www/html/repos/')

    # Create a new repodata for the local repos
    os.system('createrepo -g comps.xml /var/www/html/repos/epel/')

    # change to the nginx directory
    os.system('cd /etc/nginx')

    # make a backup of the nginx.conf file
    os.system('mv nginx.conf nginx.conf.bak')

   # get and move the updated nginx.conf file
    os.system('yum -y install wget')
    os.system('wget https://raw.githubusercontent.com/thomaskise/hello-nti-300/master/django/nginx.conf')
    os.system('mv nginx.conf /etc/nginx/nginx.conf')

    #11
   # restorecon -R /var/www/html
    os.system('restorecon -R /var/www/html')

install_nginx()
create_local_repo()
