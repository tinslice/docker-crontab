#!/usr/bin/env bash

touch /var/log/cron.log 

echo -e "\n== prepare crond config =="

cronfile=/etc/crontabs/root
echo "" > $cronfile
for cronvar in ${!CRON_*}; do
    cronvalue=${!cronvar}
    echo "$cronvalue >> /var/log/cron.log 2>&1" >> $cronfile
done
echo "" >> $cronfile

crond

echo -e "\n== crond service started ==\n"

# as 'sleep infinity' does not works on alpine we improvise asimple sleep
while sleep 3600; do :; done
