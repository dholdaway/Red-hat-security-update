#! /bin/bash

# Security Update only for Redhat
# By Darren Holdaway

# Safety feature: exit script if error is returned, or if variables not set.
# Exit if a pipeline results in an error.
set -ue
set -o pipefail

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Set Variables
today=`date +"%m-%d-%Y"`
logfile="/var/log/security-update.log"
updatelog="/var/log/security-report.log"
receiver="email address goes here"
hostname="$(hostname)"

echo "Sending"

echo "" >> $updatelog
echo $today >>$updatelog
echo "" >> $updatelog
cat $logfile >> $updatelog

echo "* * * * *" > $logfile
echo "Hostname : $hostname" >> $logfile
echo "Date : $(date)" >> $logfile
echo "* * * * *" >> $logfile
echo "" >> $logfile

echo "updates available" >> $logfile

echo "updates applied"

yum updateinfo list security >> $logfile

echo "* ^ * ^ *" >> $logfile
echo "* ^ * ^ *" >> $logfile

echo "                 " >> $logfile
echo "installed updates" >> $logfile
echo "* * * * * * * * *" >> $logfile

yum -y --security update  >> $logfile

echo "installed updates"

cat $logfile | mail -s "Security Updates For $hostname On $today" $receiver

echo "Results logged"