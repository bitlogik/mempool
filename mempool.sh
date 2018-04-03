#!/bin/bash

BITCOINCLI='/usr/bin/bitcoin-cli -conf=/etc/bitcoin/bitcoin.conf -datadir=/home/bitcoin/data/'
MEMPOOLHOME=/home/mempool
JSNAME=mempool
DESTDIR=/dev/shm/mempool-btc
mkdir -p $DESTDIR

cd $MEMPOOLHOME
rm -f $TMPFILE
$BITCOINCLI getrawmempool true > $DESTDIR/rawdump.txt
perl mempool-sql.pl < $DESTDIR/rawdump.txt

#./mkdata.sh
./mkjs.py > $DESTDIR/$JSNAME.js.new
mv $DESTDIR/$JSNAME.js.new $DESTDIR/$JSNAME.js
