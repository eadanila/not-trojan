#!/bin/bash

# This runs scripts over SSH
users=$1
com=$2

for i in $users; do
    ssh $i "$com" &
done

# wait for all remotes to finish before exiting
for job in `jobs -p`; do
    wait $job
done
exit 0

