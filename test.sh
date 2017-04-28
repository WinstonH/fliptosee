#!/bin/bash
echo "" > sakura_status.txt
# then check it over time
until [ $(cat sakura_status.txt) = true ]
do
 echo "work"
 sleep 1
done
date
