#!/bin/bash
set -e

SETTINGS_FILE=/server/.screepssc

cd /server
echo test -f ".screepssc"
ls -a
if [ ! -f "$SETTINGS_FILE" ] then
    echo "===== SETTINGS FILE MISSING, SETTING UP SCREEPS ====="
    yarn init -y
    yarn add screeps
    echo "$API_KEY" | npx screeps init
    #install standard mods
    #npm install screepsmod-mongo screepsmod-auth screepsmod-tickrate screepsmod-admin-utils screepsmod-features
    npm install screepsmod-auth screepsmod-tickrate screepsmod-admin-utils screepsmod-features
fi

echo "===== RUNNING SCREEPS ====="
exec npx screeps start
