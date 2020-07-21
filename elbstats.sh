#!/bin/bash

# Purpose: Block storage monitor in AWS EC2 running Linux, using Bash script.
# Author: P-C Markovski

iotop -b -d 3

iostat -p xvda1 1 4

ioping -c 10 -s 1M /var/www

du -c /var/log

df -hT /dev/xvda1

