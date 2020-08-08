#!/bin/bash
set -e

echo "===== SETTING UP SCREEPS ====="
yarn init -y
yarn add screeps
echo "$API_KEY" | npx screeps init
#install standard mods
#npm install screepsmod-mongo screepsmod-auth screepsmod-tickrate screepsmod-admin-utils screepsmod-features
npm install screepsmod-auth screepsmod-tickrate screepsmod-admin-utils screepsmod-features