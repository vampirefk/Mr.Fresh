#!/usr/sbin/env python
# -*- coding:utf-8 -*-
 
import math
import os
import pymysql
import json
import re
import xlsxwriter
import MySQLdb
import random



db = MySQLdb.connect("localhost", "root", "123456", "websitedb", charset='utf8' )
cursor = db.cursor()
sql_v = "select * from saleinfo"
cursor.execute(sql_v)
results = cursor.fetchall()
for result in results:
    hot = result[1]*10+result[2]*5+result[3]
    sql_w = "insert into hot( goodid,hotvalue ) values('%s', %d)" % (result[0], hot)
    cursor.execute(sql_w)
    db.commit()
    print(" 物品 ",result[0], " 的热度结果已经写入！")
