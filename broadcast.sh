#!/bin/bash

# This runs scripts over SSH
users=$1
com=$2

for i in $users; do
    ssh $i "$com && exit" &
done

exit 0

