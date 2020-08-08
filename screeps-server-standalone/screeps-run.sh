#!/bin/bash
set -e

cd /server

if [ ! -f ".screepssc" ] then
    echo "===== SETTING UP SCREEPS ====="
    yarn init -y
    yarn add screeps
    echo "$API_KEY" | npx screeps init
    #install standard mods
    #npm install screepsmod-mongo screepsmod-auth screepsmod-tickrate screepsmod-admin-utils screepsmod-features
    npm install screepsmod-auth screepsmod-tickrate screepsmod-admin-utils screepsmod-features
fi

echo "===== RUNNING SCREEPS ====="
exec npx screeps start
