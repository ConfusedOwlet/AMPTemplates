#!/bin/bash

#SCRIPT_NAME="Proton Scripts part 1"
#SCRIPTDIR=ProtonScripts/

#exec 6>display.log
#/usr/bin/Xvfb -displayfd 6 -nolisten tcp -nolisten unix &
#XVFB_PID=$!
#while [[ ! -s display.log ]]; do
#  sleep 1
#done
#read -r DPY_NUM < display.log
#rm display.log

echo "downloading winetricks"
mkdir ~/winetricks && cd ~/winetricks
wget -N https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks
chmod +x winetricks
export WINETRICKS=/home/amp/winetricks/winetricks

echo "~~~~~~~~~~~~~"
echo "~~~~installing protontricks~~~~~"
if command -v protontricks >&2; then
  pipx upgrade protontricks
  source ~/.bashrc
else
  pipx upgrade protontricks
  pipx ensurepath
  source ~/.bashrc
fi

echo "~~~~~~~~~~~~~"
echo "~~running protontricks~~"
export STEAM_DIR=/home/amp/Steam/
protontricks 376030 vcrun2013 vcrun2019 sound=disabled

#exec 6>&-
#kill $XVFB_PID
exit 0