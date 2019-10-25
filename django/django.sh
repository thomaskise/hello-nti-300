#!/bin/bash

yum -y install python-pip
sudo pip install virtualenv
pip install --upgrade pip
mkdir ~/newproject
cd ~/newproject
virtualenv newenv
source newenv/bin/activate
pip install django
django-admin startproject newproject
cd newproject/
python manage.py migrate
python manage.py createsuperuser
newproject/settings.py
python manage.py runserver 0.0.0.0:8000
