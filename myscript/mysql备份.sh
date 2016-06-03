#!/bin/bash

BakDir=/home/mysql/backup
LogFile=/home/mysql/backup/bak.log
BinLog=/home/mysql/backup/binlog/
Date=`date +%Y%m%d`
Password=Z]ZRc*zVZhgNSfhm

cd $BakDir

DumpFile=$Date.sql
GZDumpFile=$Date.sql.tgz
/usr/local/mysql/bin/mysqldump -uroot -p$Password --quick --all-databases --flush-logs --single-transaction > $DumpFile
/bin/tar zcf $GZDumpFile $DumpFile
/bin/rm -f $DumpFile
scp -p $BakDir/$GZDumpFile  10.14.5.19:/pic.zufangzi.com/.mysql/
scp -p $BinLog/* 10.14.5.19:/pic.zufangzi.com/.mysql/binlog/
file=`ls -l /home/mysql/backup/binlog/|tail -1|awk '{print $9}'`
	find $BinLog -type f ! -name $file -exec rm -fr {} \;

Last=`date +"%Y年%m月%d日 %H:%M:%S"`
echo 开始:$Begin 结束:$Last $GZDumpFile succ >> $LogFile

