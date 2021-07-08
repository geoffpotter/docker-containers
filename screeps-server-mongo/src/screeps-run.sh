#!/bin/bash
#set -e
echo "STARTING SERVER...."
SETTINGS_FILE=/server/.screepsrc



if [ ! -f "$SETTINGS_FILE" ] 
then
    echo "===== SETTINGS FILE MISSING, SETTING UP SCREEPS ====="
    npm install screeps &
    npm install $PLUGINS &
    wait
    echo "Running Screeps Init"
    echo "$API_KEY" | npx screeps init &
    echo "waiting for Screeps init to finish"
    wait
    #add mods and override mods.json
    cp mods.json.default mods.json
    echo "done, Please restart"

    
    


else
    echo "======== Override .screepsrc ==========="

    cat > .screepsrc <<EOF
;If you launch the server without running the local Steam client,
;then the Steam Web API key is required for authenticating users.
;It can be obtained on this page: http://steamcommunity.com/dev/apikey
steam_api_key = ${API_KEY}

;The port number on which the game server should listen.
port = ${GAME_PORT}

;The hostname on which the game server should listen.
host = ${GAME_HOST}

;The server password which should be provided on user sign in.
password =

;The port number on which the CLI server should listen. Defaults to port+1.
cli_port = ${CLI_PORT}

;The hostname on which the CLI server should listen.
cli_host = ${CLI_HOST}

;The number of player runner worker processes to launch.
;Setting this option to more than 1 will lead to multiple simultaneous global environments
;for each player, it is not recommended for basic setup.
runners_cnt = 1

;The number of parallel runner threads in which player scripts are executed. Don't set this
;option greater than the number of your physical CPU cores.
runner_threads = ${RUNNER_THREADS}

;The number of room processor worker processes to launch. Don't set this
;option greater than the number of your physical CPU cores.
processors_cnt = ${WORLD_THREADS}

;The path to directory where logs will be created.
logdir = logs

;The path to JSON file with the list of custom mods to load.
modfile = mods.json

;The path to directory where static assets are located.
assetdir = assets

;The path to the database file.
db = db.json

;If set, forward console messages to terminal
log_console = false

;How many log files to keep when rotating.
log_rotate_keep = 5

;If set, disable built-in storage, useful when you use some other implementation.
storage_disabled = ${STORAGE_DISABLED}

;Automatically restart child processes.
restart_interval = 3600

[mongo]
host = ${MONGO_HOST}

[redis]
host = ${REDIS_HOST}
EOF

    echo "===== RUN SCREEPS ====="

    npx screeps start
fi



