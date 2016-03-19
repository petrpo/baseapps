#!/bin/bash

SERVER_APPS="mc aptitude iftop tcpdump vim openssh-server rsync htop screen traceroute git"
DESKTOP_APPS="keepass2 vim-gtk xterm"

# run under root privileges
if [[ $EUID -ne 0 ]]; then
  echo "You must be a root user to run this script" 2>&1
  exit 1
fi

# would be nice to check debian version and add dropbox repository according to codename/version
# lsb_release -c|awk '{print $2}' 
#
# UBUNTU
#Add the following line to /etc/apt/sources.list. Replace natty with your build's name below.
#
#deb http://linux.dropbox.com/ubuntu natty main
#
#To import our GPG keys into your apt repository, perform the following command from your terminal shell:
#
#$ sudo apt-key adv --keyserver pgp.mit.edu --recv-keys 5044912E

# DEBIAN
#Add the following line to /etc/apt/sources.list. Replace squeeze with your build's name.
#
#deb http://linux.dropbox.com/debian squeeze main
#
#To import our GPG keys into your apt repository, perform the following command from your terminal shell:
#
#$ sudo apt-key adv --keyserver pgp.mit.edu --recv-keys 5044912E

sudo apt-get update

if [ "$XDG_CURRENT_DESKTOP" = "" ]
then
  echo
  echo "Let's unify server with these apps : "
  echo
  echo "mc aptitude iftop tcpdump vim openssh-server rsync htop screen traceroute git"
  echo
  sleep 5
  sudo apt-get -y install $SERVER_APPS
else
  echo
  echo "Let's unify Desktop"
  echo
  sleep 2
  sudo apt-get -y install $SERVER_APPS
  sudo apt-get -y install $DESKTOP_APPS
fi

HOST_VERSION=`cat /etc/issue.net`

echo
echo "$HOST_VERSION is unified according to universe standards :-)"
echo
