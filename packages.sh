#!/bin/bash
yum -y install wget

wget https://raw.githubusercontent.com/thomaskise/hello-nti-300/master/packages.txt

for packages in ($(cat /etc/packages.txt); do 
  yum -y install $packages;
done
