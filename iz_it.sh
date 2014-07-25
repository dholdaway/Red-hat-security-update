#!/bin/bash
#Filename:iz_it.sh
#Description: check for file existence

file=""
IP_LIST="127.0.0.0"
#provide the list of remote machine IP addresses

(
for ip in $hosts;
#for ip in $IP_LIST;
do
  if  ssh $ip test -e $file;
      then echo $file exists
      else echo $file does not exist
  fi

done