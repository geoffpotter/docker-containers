#!/bin/bash
set -e

cd /server

if [ ! -f ".screepssc" ] then
    sh /screeps-install.sh
fi

echo "===== RUNNING SCREEPS ====="
exec npx screeps start
