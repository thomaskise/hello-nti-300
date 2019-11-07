#!/usr/bin/python

import os                                                                                           # adds access to os.system
import re
import subprocess                                                                                   # allows you to spawn new processes, connect to their input/output/error pipes, and obtain their return codes

print ('Setting up user django')                                                                    # log messaging
os.system ('adduser -M django' + \
    '&& usermod -L django' + \
    '&& chown - R django')                                                                          # add new apache user and set permissions

def setup_install():
    print ('installing pip and virtualenv so we can give django its own version of python')         # log messaging
    os.system('yum -y install python-pip && pip install --upgrade pip')                             # install pyton and then upgrade to latest version
    os.system('pip install virtualenv')                                                             # install virual environemtn manager
    os.chdir('/opt')                                                                                # change to the directory created during install
    os.mkdir('/opt/django')                                                                         # create a directory for django virtualenv
    os.chdir('/opt/django')                                                                         # change to that directory
    os.system('virtualenv django-env')                                                              # set-up the virutal environment
    os.system('chown -R django /opt/django')                                                        # set the owner/permissions for the directory of the django ve
    
def django_install():
    print ('activating virtualenv and installing django after pre-requiirements have been met')     # log messaging
    os.system('source /opt/django/django-env/bin/activate ' + \
        '&& pip install django')                                                                    # activate virtual environment and install django
    os.chdir('/opt/django')                                                                         # change to the django ve directory
    os.system('source /opt/django/django-env/bin/activate ' + \
        '&& django-admin --version ' + \
        '&& django-admin startproject project1')                                                    # activate, log version, set-up new project, "project1"

def django_start():
    print('starting django')                                                                        # log messaging
    os.system('chown -R django /opt/django')                                                        # set ownership/permissions for directories and sub directories
    os.chdir('/opt/django/project1')                                                                # change to the proejct directory
    os.system('source /opt/django/django-env/bin/activate ' + \
        '&& python manage.py migrate')                                                              # activate pythone and migrate to the project
    os.system('source /opt/django/django-env/bin/activate ' + \
        '&& echo "from django.contrib.auth import get_user_model; User = get_user_model(); User.objects.create_superuser(\'admin\', \'admin@newproject.com\', \'pw123456\')" | python manage.py shell')
                                                                                                    # above line sets-up admin user
    outputwithnewline = subprocess.check_output('curl -s checkip.dyndns.org | sed -e \'s/.*Current IP Address: //\' -e \'s/<.*$//\'',shell=True)
                                                                                                    # capture IP Address in a string var
    print outputwithnewline                                                                         # log the IP Address
    output = outputwithnewline.replace("\n", "")                                                    # strip the IP Address var of the EOL character
    old_string = "ALLOWED_HOSTS = []"                                                               # set var with old value of allowed hosts line
    new_string = 'ALLOWED_HOSTS = [\'{}\']'.format(output)                                          # set var with new value of allowed hosts line
    print (new_string)                                                                              # log the new value
    print (old_string)                                                                              # log the olde value
    
    with open('project1/settings.py') as f:
        newText=f.read().replace(old_string, new_string)                                            # open settings.py and replace the old value with the new value
    with open('project1/settings.py', "w") as f:
        f.write(newText)                                                                            # write the updated settings.py file
    with open('project1/settings.py') as f:
        f.close()                                                                                   # close the settings.py file

    os.system('sudo -u django sh -c "source /opt/django/django-env/bin/activate && python manage.py runserver 0.0.0.0:8000&"')
                                                                                                    # activate and start pytohn

# run the install and start functions
setup_install()
django_install()
django_start()    
print ('*************** django.py complete ************')                                           # log completion
