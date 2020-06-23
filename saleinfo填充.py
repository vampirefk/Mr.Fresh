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
sql_v = "select no from good_detail "
cursor.execute(sql_v)
users = cursor.fetchall()
for user in users:
    sale = random.randint(0,40)
    if sale != 0:
        cart = sale * random.randint(2,10)
        click = sale * random.randint(25,80)
    else:
        cart = random.randint(0,20)
        click = cart + random.randint(10,100)

    sql_w = "insert into saleinfo( goodid,sales,cartnum,clicknum ) values('%s', %d,%d,%d)" % (user[0], sale,cart,click)
    cursor.execute(sql_w)
    db.commit()
    print(" 物品 ", user[0], " 的推荐结果已经写入！")
