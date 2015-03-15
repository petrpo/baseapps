#!/bin/bash

SYSTEM=`cat /etc/issue.net`
sudo apt-get update
sudo apt-get -y install mc aptitude iftop tcpdump xterm vim ssh rsync git htop

echo "System $SYSTEM is unified :-)"
