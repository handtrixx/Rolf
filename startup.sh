#!/bin/bash
set -e

source /opt/gow/launch-comp.sh

KEYBOARDLAYOUT=${KEYBOARDLAYOUT}
#if no keyboard layout is set, default to us
if [ -z "$KEYBOARDLAYOUT" ]; then
    KEYBOARDLAYOUT="us"
fi
gow_log "Keyboard layout set to $KEYBOARDLAYOUT"

#check if directories /home/retro/retrodeck exists, if not create them
if [ ! -d "/home/retro/retrodeck" ]; then    
    mkdir /home/retro/retrodeck
    gow_log "Created /home/retro/retrodeck directory"
else
    gow_log "/home/retro/retrodeck directory already exists, will not touch it."
fi

gow_log "Starting RetroDeck"

source /opt/gow/launch-comp.sh
#launcher /usr/bin/dosbox-x -conf /home/retro/dos.conf -set "keyboardlayout=$KEYBOARDLAYOUT"
