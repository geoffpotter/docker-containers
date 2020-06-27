#!/bin/bash
set -e

function init_srv(){
	echo "===== SETTING UP SCREEPS ====="
	#setup directories
    mkdir -p /config /server
    chown -R nobody:users /config /server
    #install screeps
    cd /server
    npm install screeps
}

function run_srv(){
	#run screeps
    cd /server
    exec npc screeps start
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