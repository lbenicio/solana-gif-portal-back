#!/bin/bash

sleepInterval=3 # hours
sleepIntervalInSeconds=$(($sleepInterval*60*60+600))
#echo $sleepIntervalInSeconds
while [ 1 ]; do
        status="Error"
        echo "Requesting SOLs on DevNet..."
        solana airdrop 2 > /dev/null 2>&1;
        if [ $? -eq 0 ]; then
                status="Success";
        fi
        balance=$(solana balance);
        echo "Status: $status - $balance"
        echo "Sleeping for $sleepInterval hours";
        sleep $sleepIntervalInSeconds;
done
