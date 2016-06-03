#!/bin/bash
num1=$(cat /proc/sys/net/ipv4/netfilter/ip_conntrack_count)
sum=$(cat /proc/sys/net/ipv4/ip_conntrack_max)
conunter=$(awk 'BEGIN{printf "%.2f\n",'$num1'/'$sum'}')
flag=`expr $conunter \> "0.85"` 
if [ "$flag" = "1" ];
then
	echo "eventftmsweb2 ip_conntrack: table full \n ip_conntrack_max=$sum ip_conntrack_count=$num1" | mail -s "eventftmsweb2err" dong.qian@frontnetwork.com
fi
