#!/bin/bash

NAME=`getent passwd $(whoami) | cut -d ':' -f 5 | cut -d ' ' -f 1`
DIRS="$HOME/
`ls -d $HOME/*/`"
IFS=" "
DIR="`echo $DIRS | shuf -n1`"
FNAME="_hi_$NAME.txt"

if [[ ! -e $HOME/.config/lsconfig/state/hello.log ]]; then
  exit 1
fi

for ((i=0; i<100; i++)); do
  PATH=$DIR$i$FNAME
  if [[ ! -e $PATH ]]; then
    echo $PATH >> $HOME/.config/lsconfig/state/hello.log
    echo "Hi $NAME" >> $PATH
    exit 0
  fi
done

