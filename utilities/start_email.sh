#!/bin/bash
: '
start_mail.sh version 1.0

This script will start an email to everyone logged on the the server
Simple; no arguments; simply type ./start_mail.sh on the command line
'

filename="who"                                      # assign var for argument 1
field="f1"                                          # assign var for argument 2
mail $($filename | cut -d' ' -$field)               # output the text for the requested field