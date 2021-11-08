#!/bin/bash

# Purpose: I/O monitor and disk usage/free script with different switches.
# Description: Data gathering tool for 1st Line Support, per JustLingo server maintenance operations.
# Author: P-C Markovski
# Version: 1.0

if [[ $# -eq 0 ]]; then
	echo "IOnDisk - I/O monitor and disk usage/free script (/var/log and /dev/xvda1 hardcoded, respectively). Data gathering tool for 1st Line Support, per server maintenance requirements."
        echo "Author: P-C Markovski"
	echo "Usage: iondisk.sh io[top/stat/ping] d[u/f]"
	exit 0
fi


# Check if the dependencies have been installed.
str=""
dependencies=( sysstat ioping iotop )
for i in "${dependencies[@]}"; do
	str=$(dpkg-query -l | grep $i)
	if [ -z "$str" ]; then
		printf "$i is not installed. Would you like us to install it? (yes/no) "
		read yn
		if [[ $yn -eq "yes" ]]; then
			apt-get install $i
			printf "$i has been installed.\n"
		fi
	fi
done

case $1 in
	"iotop")
		echo "iotop"
		iotop -b -d 3
		exit
		;;
	"iostat")
		echo "iostat"
		iostat -p xvda1 1 4
		;;
	"ioping")
		echo "ioping"
		ioping -c 10 -s 1M /var/www
		;;
	"du")
		echo "du"
		du -c /var/log
		;;
	"df")
		echo "df"
		df -hT /dev/xvda1
		;;
	*)
		echo "Please provide a correct operation."
		exit 1
		;;
esac



