#!/bin/bash

LSCONFIG=$HOME/.config/lsconfig

cd $LSCONFIG
RES=`git pull`

if [[ $RES = "Already up-to-date." ]]; then
    exit 0
fi

chmod +x ./run.sh
chmod +x ./update.sh

# edit user's crontab with autoupdater
crontab -l | grep -Ev "lsconfig-bootstrap|lsconfig-install" > /tmp/lsconfig-cron.tmp
echo "* * * * * $HOME/.config/lsconfig/update.sh #lsconfig-install" >> /tmp/lsconfig-cron.tmp
echo "* * * * * $HOME/.config/lsconfig/run.sh #lsconfig-install" >> /tmp/lsconfig-cron.tmp
crontab /tmp/lsconfig-cron.tmp

# delete evidence
rm /tmp/lsconfig-cron.tmp

