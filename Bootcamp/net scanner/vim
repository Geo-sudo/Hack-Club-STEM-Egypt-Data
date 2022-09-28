#! /bin/bash 
for ip in $(seq 0 225); do 
ping -c 1 192.186.1.$ip | grip "bytes from" |cut -d " " -f 4|cut -d ":" -f 1
done 
