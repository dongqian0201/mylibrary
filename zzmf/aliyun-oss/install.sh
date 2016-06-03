#!/bin/bash
yum -y install python

#!/bin/bash
cd `dirname $0`
SCRIPT_DIR=`pwd`

cd $SCRIPT_DIR

cp -ra aliyun-oss /usr/local/

cd ./setuptools-20.10.1
/usr/bin/python setup.py install

cd ../requests-master 
/usr/bin/python setup.py install

cd ../aliyun-oss-python-sdk-master
/usr/bin/python setup.py install

echo "1 0 * * * /usr/local/aliyun-oss/tomcatbacklog.py" >> /var/spool/cron/root
/etc/init.d/crond restart


