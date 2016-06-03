#!/bin/bash
conunter=$(df -h | grep sda1 | awk '{print $5}' | cut -c1-2)
flag=`expr $conunter \> "90"`
if [ "$flag" = "1" ];
then
        echo "eventftmsweb2 disk full \n used=$conunter" | mail -s "eventftmsweb2err" dong.qian@frontnetwork.com
fi
