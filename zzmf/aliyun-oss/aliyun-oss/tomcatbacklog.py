#!/usr/bin/python

import datetime
import glob
import oss
import os
import socket
import zipfile

localIP = socket.gethostbyname(socket.gethostname())

backlogday = datetime.date.today() - datetime.timedelta(days=3)

dateS = backlogday.strftime('%Y-%m-%d')

for filename in glob.glob("/opt/tomcat/logs/*"+dateS+"*"):
    zfile = filename+".zip"
    try:

        f = zipfile.ZipFile(zfile,'w',zipfile.ZIP_DEFLATED)
        f.write(filename)
        
        os.remove(filename)

    except  BaseException, msg:
        print msg
    finally:
        f.close()

    oss.uploadFile(localIP+"/"+dateS+zfile,zfile)

    os.remove(zfile)
