#!/bin/bash

yum -y install python-pip
sudo pip install virtualenv
pip install --upgrade pip
mkdir ~/newproject
cd ~/newproject
virtualenv newenv
source newenv/bin/activate
pip install django
django-admin --version
django-admin startproject newproject
cd newproject/
python manage.py migrate
echo "from django.contrib.auth import get_user_model; User = get_user_model(); User.objects.create_superuser('admin', 'admin@newproject.com', 'pw123456')" | python manage.py shell
# python manage.py createsuperuser           # <- work around this to add a user (above)
myip=$(curl -s checkip.dyndns.org | sed -e 's/.*Current IP Address: //' -e 's/<.*$//')
echo $myip
# newproject/settings.py                     # sed search and replace (above)
python manage.py runserver 0.0.0.0:8000
