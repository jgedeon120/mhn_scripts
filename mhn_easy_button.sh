#!/bin/bash

set -e
SCRIPTS=`/opt/mhn/scripts`
echo -n "Which Git Repo would you like to use? "
read GIT_USER

# Expand var partition for my base OS installs.
mount | grep vg-var &> /dev/null
if [ "$?" = "0" ]; then
	/sbin/lvextend -L 5G /dev/mapper/vg-var
	/usr/sbin/xfs_growfs /var
else
	echo "This is a flat install moving on"
if

apt-get update
apt-get install -y git

cd /opt
echo "Cloning Git Repo"
git clone https://github.com/$GIT_USER/mhn.git

echo "Installing hpfeeds"
bash $SCRIPTS/install_hpfeeds.sh

echo "Installing mnemosyne"
bash $SCRIPTS/install_mnemosyne.sh

echo "Installing honeymap"
bash $SCRIPTS/install_honeymap.sh

echo "Installing mhnserver"
bash $SCRIPTS/install_mhnserver.sh
