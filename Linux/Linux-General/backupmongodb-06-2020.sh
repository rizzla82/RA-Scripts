#!/bin/bash

DIR=`date +%d%m%y`
# DEST=/media/windowsshare/db/$DIR
DEST=/opt/backups/rc-backups/daily/$DIR

mkdir $DEST
mongodump -o $DEST >> /$DEST/output.log

# find /media/windowsshare/db/* -type d -mtime +7 | xargs rm -rf
#find /home/bca/All_App03/RC_Backup/daily/* -type d -mtime +7 | xargs rm -rf
find /opt/backups/rc-backups/daily/* -type d -mtime +7 | xargs rm -rf
