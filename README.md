# BTC Fee backend

This is the code to create the mempool statistics from a bitcoin node. This is the backend of btc-fee.net , a Bitcoin fee estimator web service.

It is forked from https://jochen-hoenicke.de/queue/ which provides data about txs in the memory pool.


## Fee Algorithm

MORE DETAILS LATER

This fee estimation algorithm is based on the present status of the mempool. The next blocks are build from the mempool, each new block approximatively taking 1 MB of the highest fees transactions.
The idea is to sort all transactions in the mempool from the highest fee to the lowest and sum the cumulative size of the transactions. The present fee required for nearly next block is the fee level where 1MB is reached. Then 4MB and 10 MB are used for medium and slow fee rate.


## Installation:

Only requires a system with sh and python3.

You need to run a bitcoin full node. It can be a pruned node or an
archival node. I assume you have already set it up. You also need to
support RPC to this node. Add rpcuser/rpcpassword to bitcoin.conf to enable
this.

    git clone https://github.com/bitlogik/mempool

Edit `mempool.sh` to adapt paths as necessary, especially the path to 
bitcoin-cli. Add a bitcoin.conf with rpcuser/rpcpassword settings to 
`/home/mempool/.bitcoin`, to be able to use bitcoin-cli. You can test your
setup by running

    bitcoin-cli getmempoolinfo


Testing :

    cd mempool
    ./mempool.sh

Check that everything works. There should be a file `mempool.log` containing one line of statistics.
There should be newly created files in `/dev/shm/mempool-btc` that contain the dynamic data the
webserver should serve. In the webserver directory :

    ln -s /dev/shm/mempool-btc/mempool.js mempool.js
    ln -s /dev/shm/mempool-btc/api.json api.json

Run :

    ./start-mempool.sh &

