#!/bin/bash

#install IRI+Nelson+Nodejs - Run this manually
#curl https://raw.githubusercontent.com/automyr/scripts/master/iota_nelson_install.sh | bash

#install yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get install yarn

#Install hooknode
cd /home/iota/ && mkdir hooknode && cd hooknode
git clone https://github.com/oysterprotocol/hooknode
git checkout --track origin/version-2
cp .env.example .env
#sudo pm2 start yarn

#save pm2 processes to run on boot
sudo pm2 save

#get public ip
ips="$(dig +short myip.opendns.com @resolver1.opendns.com)"

#prepare and show confirmation message
endmsg1="Installation finished, your hooknode is set up at http://"
endmsg2=":250"
echo $endmsg1$ips$endmsg2
