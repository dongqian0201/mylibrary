#/bin/bash
set -e

cd `dirname $0`

warDir=$1
backupDir=$2
nowTime=$3

warType=$4

tomcatPath=$5

webUser=$6

nowtime=`date +%Y%m%d%H%M%S%N`

#echo $warDir $backupDir $nowTime $warType $tomcatPath $webUser

$tomcatPath/bin/shutdown.sh

for i in {1..5}
do
    sleep 1
    echo .
   
done

mkdir -p $backupDir/$nowtime

#mv $tomcatPath/webapps/ROOT* $backupDir/$nowtime/

rm -rf $tomcatPath/work/Catalina/localhost/

mv $warDir/$warType/ROOT.war $tomcatPath/webapps/

#/usr/bin/sudo -u $6 $tomcatPath/bin/catalina.sh start && tail -f $tomcatPath/logs/catalina.`date +%Y-%m-%d`.out | sed -e '/Server\sstartup\sin/q'
$tomcatPath/bin/catalina.sh start && tail -f $tomcatPath/logs/catalina.`date +%Y-%m-%d`.out | sed -e '/Server\sstartup\sin/q'


