#!/bin/sh
df -H | grep -vE '^Filesystem|tmpfs|cdrom' | awk '{ print $5 " " $1 }' | while read output;
do
  echo $output
  usep=$(echo $output | awk '{ print $1}' | cut -d'%' -f1  )
  partition=$(echo $output | awk '{ print $2 }' )
  
if [ $usep -ge 90 ]; then
    echo "Running out of space \"$partition ($usep%)\" on $(hostname) as on $(date)" 
	exit 1
   # | mail -s "Alert: Almost out of disk space $usep%" you@somewhere.com
	
else
    echo "DIR is not full , continue deploy code .........................."

fi
done
