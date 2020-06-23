#!/usr/sbin/env python
# -*- coding:utf-8 -*-
 
import math
import os
import pymysql
import json
import re
import xlsxwriter
import MySQLdb

# ItemCF算法
def ItemSimilarity(train):
    # 物品-物品的共同矩阵
    C = dict()
    # 物品被多少个不同用户购买
    N = dict()
    for u, items in train.items():
        for i in items.keys():
            N.setdefault(i, 0)
            N[i] += 1
            C.setdefault(i, {})
            for j in items.keys():
                if i == j:
                    continue
                C[i].setdefault(j, 0)
                C[i][j] += 1
    # 计算相似度矩阵
    W = dict()
    for i, related_items in C.items():
        W.setdefault(i, {})
        for j, cij in related_items.items():
            W[i][j] = cij / math.sqrt(N[i] * N[j])
    return W
 
# 推荐前K个用户
def Recommend(train, user_id, W, K, N):
    rank = dict()
    action_item = train[user_id]
    for item, score in action_item.items():
        for j, wj in sorted(W[item].items(), key=lambda x:x[1], reverse=True)[0:K]:
            if j in action_item.keys():
                continue
            rank.setdefault(j, 0)
            rank[j] += score * wj
    #print (rank.items())
    return sorted(rank.items(), key=lambda x:x[1], reverse=True)[0:N]


db = MySQLdb.connect("localhost", "root", "123456", "websitedb", charset='utf8' )
cursor = db.cursor()
sql =  "select * from comment"
cursor.execute(sql)
result = cursor.fetchall()
train = dict()

for line in result:
    user = line[2]
    item = line[1]
    score = line[3]
    train.setdefault(user, {})
    train[user][item] = float(score)    
    
'''for line in open('requests.txt', 'r'):
    user, item, score = line.strip().split(",")
    train.setdefault(user, {})
    train[user][item] = float(score)'''
W = ItemSimilarity(train)

sql_v = "select no from user_test "
cursor.execute(sql_v)
users = cursor.fetchall()

sql = """truncate table rec"""
try:
   cursor.execute(sql)
   db.commit()
   print("delete successfully!")
except:
   db.rollback()

for user in users:
    result = Recommend(train, user[0], W, 3, 20)
    for i in result:
        sql_w = "insert into rec( userid,goodid ) values('%s', '%s')" % (user[0], i[0])
        cursor.execute(sql_w)
        db.commit()
    print(" 用户 ", user[0], " 的推荐结果已经写入！")



    
'''print (result)
reslist = [x[0] for x in result]
print(reslist)
'''

