#!/usr/bin/python

import pymysql

# Open database connection
db = pymysql.connect("127.0.0.1","root","Vishal@12345")

cur = db.cursor()

cur.execute("SHOW DATABASES")

# print all the first cell of all the rows
for row in cur.fetchall():
    print(row[0])

db.close()
