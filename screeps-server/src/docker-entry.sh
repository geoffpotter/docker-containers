#!/bin/bash
set -e

function init_srv(){
	echo "===== SETTING UP SCREEPS ====="
	#setup directories
    mkdir -p /server
    chown -R nobody:users /server
    #install screeps
    cd /server
    npm install screeps

	#install standard mods
	npm install screepsmod-mongo screepsmod-auth screepsmod-tickrate screepsmod-admin-utils screepsmod-features
}

function run_srv(){
	#run screeps
    cd /server
    exec npx screeps start
}

case $1 in
	init)
		init_srv
		;;
	*)
		run_srv
		;;
esac