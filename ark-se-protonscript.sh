#!/bin/bash

SCRIPT_NAME=$(echo \"$0\" | xargs readlink -f)
SCRIPTDIR=$(dirname "$SCRIPT_NAME")

exec 6>display.log
/usr/bin/Xvfb -displayfd 6 -nolisten tcp -nolisten unix &
XVFB_PID=$!
while [[ ! -s display.log ]]; do
  sleep 1
done
read -r DPY_NUM < display.log
rm display.log

#mkdir winetricks && cd winetricks
wget -N https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks
chmod +x winetricks/winetricks

export WINETRICKS=winetricks

pipx upgrade protontricks

protontricks 376030 vcrun2013 vcrun2019 sound=disabled

exec 6>&-
kill $XVFB_PID

exit 0