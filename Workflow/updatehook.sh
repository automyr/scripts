#!/bin/bash
echo "Starting"
ssh -t oyster@192.168.56.10 'cd hooknode && sudo git pull origin'
echo "Done! This window will close in 10 seconds, just in case you need to look at any errors"
sleep 10