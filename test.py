#!/usr/bin/python

import pymysql

# Open database connection
db = pymysql.connect("3.3.0.6","root","root" )

cur = db.cursor()

cur.execute("SHOW DATABASES")

# print all the first cell of all the rows
for row in cur.fetchall():
    print(row[0])

db.close()
