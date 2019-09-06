#!/usr/bin/python
# -*- coding: utf8 -*-

import json
file = open("mempool.log", "r")
jdatamem = file.read()
datamem = json.loads(jdatamem[:-2])
szarr = datamem[1]
totsz = 0
totszarr = []
for szi in range(len(szarr),1,-1):
	totsz += szarr[szi-1]
	totszarr.append(totsz)
file.close()
totszarr.reverse()
print("call(["+json.dumps([datamem[0],totszarr])+"])")
