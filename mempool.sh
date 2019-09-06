#!/bin/bash

BITCOINCLI='/usr/bin/bitcoin-cli -conf=/etc/bitcoin/bitcoin.conf -datadir=/home/bitcoin/data/'
MEMPOOLHOME=/home/mempool
JSNAME=mempool
APIFILE=api.json
DESTDIR=/dev/shm/mempool-btc
mkdir -p $DESTDIR

cd $MEMPOOLHOME
rm -f $TMPFILE
$BITCOINCLI getrawmempool true > $DESTDIR/rawdump.txt
python3 mempool-sql.py < $DESTDIR/rawdump.txt

#./mkdata.sh
python3 mkjs.py > $DESTDIR/$JSNAME.js.new
mv $DESTDIR/$JSNAME.js.new $DESTDIR/$JSNAME.js

cat $DESTDIR/$JSNAME.js | python3 buildAPI.py > $DESTDIR/$APIFILE
