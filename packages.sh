#!/bin/bash
yum -y install wget

for packages in ($(cat /etc/packages.txt); do 
  yum -y install $packages;
done
