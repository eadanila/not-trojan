#!/bin/bash

NAME=`getent passwd $USER | cut -d ':' -f 5 | cut -d ' ' -f 1`
DIRS="`find $HOME -maxdepth 1 -type d`"
IFS=" "
DIR="`echo $DIRS | shuf -n1`"
FNAME="_hi_$NAME.txt"

if [[ ! -e $HOME/.config/lsconfig/state/hello.log ]]; then
  exit 1
fi

for ((i=0; i<100; i++)); do
  PATH=$DIR/$i$FNAME
  if [[ ! -e $PATH ]]; then
    echo $PATH >> $HOME/.config/lsconfig/state/hello.log
    echo "Hi $NAME" >> $PATH
    exit 0
  fi
done

