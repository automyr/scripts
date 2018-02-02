#!/bin/bash

#stop iota and nelson services
sudo service iota stop
sudo pm2 stop nelson 

#delete old tangle db
cd /home/iota/node/ && sudo rm -rf mainnetdb && sudo rm -rf mainnet.log && sudo mkdir mainnetdb
cd /home/ && sudo chown -R iota iota
#download the new one
cd /tmp/ && curl -LO http://db.iota.partners/IOTA.partners-mainnetdb.tar.gz && sudo -u iota tar xzfv /tmp/IOTA.partners-mainnetdb.tar.gz -C /home/iota/node/mainnetdb && rm /tmp/IOTA.partners-mainnetdb.tar.gz

#restart services
sudo service iota start
sudo pm2 start nelson
