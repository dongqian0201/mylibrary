#!/usr/bin/python
# -*- coding: utf-8 -*-

import oss2

endpoint = 'http://oss-cn-beijing-internal.aliyuncs.com' # 假设你的Bucket处于杭州区域

auth = oss2.Auth('xxxxxxxxxx','xxxxxxxxxxxxxxxxx')
bucket = oss2.Bucket(auth,endpoint,'xxxxxxxxx')


def uploadFiles(list):
    for fileName in list:
        bucket.put_object_from_file(fileName,list[fileName])


def downloadFiles(list):
    for fileName in list:
        bucket.get_object_to_file(fileName,list[fileName])


def uploadFile(key,fileName):
    bucket.put_object_from_file(key,fileName)

def downloadFile(key,fileName):
    bucket.get_object_to_file(key,fileName)


def putFile(key,file):
    # 上传
    bucket.put_object(key,file)

def getFile(key):
    # 下载
    return bucket.get_object(key).read()

def delFile(key):
    # 删除
    bucket.delete_object(key)

def printList():
    # 遍历Bucket里所有文件
    for object_info in oss2.ObjectIterator(bucket):
        print(object_info.key)
