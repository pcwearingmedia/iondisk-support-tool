#!/bin/bash

# Purpose: I/O monitor and disk usage/free script with different switches.
# Purpose: Data gathering tool for 1st Line Support, per JustLingo server maintenance operations.
# Author: P-C Markovski
# Version: 1.0

if [[ $# -eq 0 ]]; then
	echo "ELBstats 0.5 - AWS Elastic Block Storage (ELB) stats"
        echo "Author: P-C Markovski"
	echo "Usage: elbstats.sh io[top/stat/ping] d[u/f]"
	exit 0
fi


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



