#!/bin/bash
if [ -e /usr/bin/vim ]; then 
  exit 0; 
fi

yum -y install wget

wget https://raw.githubusercontent.com/thomaskise/hello-nti-300/master/package/packages.txt

for packages in ($(cat /etc/packages.txt); do 
  yum -y install $packages;
done

rm -f packages.txt
