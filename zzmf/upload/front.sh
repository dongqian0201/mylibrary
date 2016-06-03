#!/bin/bash
set -e


cd `dirname $0`
SCRIPT_DIR=`pwd`


warDir=`cat ./conf/sysconfig.conf | grep '^warDir=' | awk -F"=" '{print $2}'`
backupDir=`cat ./conf/sysconfig.conf | grep '^backupDir=' | awk -F"=" '{print $2}'`


hosts=`cat ./conf/backage.conf | grep '^front=' | awk -F"=" '{print $2}'`



nowTime=`date +%Y%m%d%H%M%S%N`

function backupScript() {
#    ssh $host
#    scp $warDir/front/ROOT.war $host:$warDir/front/
#    ssh $host /opt/tomcat/bin/upload.sh $warDir $backupDir $nowTime front /opt/tomcat/ web


cp /root/front/ROOT.war  /data/upload/front/
/opt/tomcat/bin/upload.sh $warDir $backupDir $nowTime front /opt/tomcat/ web

}


for host in $hosts
do
    backupScript


done

