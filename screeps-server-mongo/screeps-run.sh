#!/bin/sh
set -e
echo "STARTING SERVER...."
SETTINGS_FILE=/server/.screepsrc

cd /server

if [ ! -f "$SETTINGS_FILE" ] 
then
    echo "===== SETTINGS FILE MISSING, SETTING UP SCREEPS ====="
    yarn init -y
    yarn add screeps@"$SCREEPS_VERSION"
    echo "$API_KEY" | npx screeps init
    #install mods
    npm install $PLUGINS
fi

echo "===== RUNNING SCREEPS ====="
exec npx screeps start
