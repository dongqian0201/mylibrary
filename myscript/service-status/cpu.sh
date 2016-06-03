#!/bin/bash
conunter=$(vmstat | sed -n '3p'| awk '{print $14}')
flag=`expr $conunter \> "50"`
if [ "$flag" = "1" ];
then
        echo "eventftmsweb2 cpu full \n used=$conunter" | mail -s "eventftmsweb2err" dong.qian@frontnetwork.com
fi
