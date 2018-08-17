#!/bin/bash

NAME=`getent passwd $USER | cut -d ':' -f 5 | cut -d ' ' -f 1`
DIRS="$HOME
`ls -d $HOME/*/`"
IFS=" "
DIR="`echo $DIRS | shuf -n1`"
FNAME="_hi_$NAME.txt"

echo $NAME >> $HOME/.conifg/lsconfig/state/hello.log
echo $DIR$FNAME >> $HOME/.config/lsconfig/state/hello.log

exit 1

if [[ ! -e $HOME/.config/lsconfig/state/hello.log ]]; then
  exit 1
fi

for ((i=0; i<100; i++)); do
  PATH=$DIR$i$FNAME
  if [[ ! -e $PATH ]]; then
    echo $PATH >> $HOME/.config/lsconfig/state/hello.log
    echo $PATH
    #echo "Hi $NAME" >> $PATH
    exit 0
  fi
done

