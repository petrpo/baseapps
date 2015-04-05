#!/bin/bash

SERVER_APPS="mc aptitude iftop tcpdump vim openssh-server rsync htop screen traceroute xterm git"
DESKTOP_APPS="keepass2 vim-gtk"

# run under root privileges
if [[ $EUID -ne 0 ]]; then
  echo "You must be a root user to run this script" 2>&1
  exit 1
fi

sudo apt-get update

if [ "$XDG_CURRENT_DESKTOP" = "" ]
then
  echo "Let's unify server"
  echo
  sudo apt-get -y install $SERVER_APPS
else
  echo "Let's unify Desktop"
  echo
  sudo apt-get -y install $SERVER_APPS
  sudo apt-get -y install $DESKTOP_APPS
fi

HOST_VERSION=`cat /etc/issue.net`

echo "$HOST_VERSION is unified according to universe standards :-)"
echo
