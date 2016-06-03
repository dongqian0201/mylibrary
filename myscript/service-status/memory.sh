#!/bin/bash
num1=$(free -m | grep - | awk '{print $3}')
sum=$(free -m | grep Mem | awk '{print $2}')
conunter=$(awk 'BEGIN{printf "%.2f\n",'$num1'/'$sum'}')
flag=`expr $conunter \> "0.8"`
if [ "$flag" = "1" ];
then
        echo "eventftmsweb2 memory full \n total=$sum used=$num1" | mail -s "eventftmsweb2err" dong.qian@frontnetwork.com
fi
