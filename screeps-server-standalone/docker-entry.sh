#!/bin/bash
set -e

function init_srv(){
	echo "===== SETTING UP SCREEPS ====="
	yarn init -y
	yarn add screeps
	npx screeps init
	#install standard mods
	npm install screepsmod-mongo screepsmod-auth screepsmod-tickrate screepsmod-admin-utils screepsmod-features
}


function run_srv(){
	echo "===== RUNNING SCREEPS ====="
	cd /server
	npx screeps start
}
case $1 in
	init)
		init_srv
		;;
	run)
		run_srv
		;;
	*)
		exec "$@"
		;;
esac