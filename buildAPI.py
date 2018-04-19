#!/usr/bin/python
# -*- coding: utf8 -*-

import json
import sys

jTxSzArray = sys.stdin.read()
TxSzArray = json.loads(jTxSzArray[6:-3])
ranges = [1,2,3,4,5,6,7,8,10,12,14,17,20,25,30,40,50,60,70,80,100,120,
	140,170,200,250,300,400,500,600,700,800,1000,1200,1400,1700,2000,
	2500,3000,4000,5000,6000,7000,8000,10000];
TxSzArrayMB = map(lambda x: x/1000000.0, TxSzArray[1])
iFast = len(filter(lambda x: x>1, TxSzArrayMB))
if iFast == 0:
	iFast = 1
iMed = len(filter(lambda x: x>4, TxSzArrayMB))
iSlow = len(filter(lambda x: x>10, TxSzArrayMB))
FastFee = ranges[iFast]
MedFee = ranges[iMed]
SlowFee= ranges[iSlow]
print json.dumps({"fast":FastFee,"medium":MedFee,"slow":SlowFee,"time":TxSzArray[0]})
