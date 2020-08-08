# set base os
FROM phusion/baseimage:18.04-1.0.0

ENV SCREEPS_VERSION 4.0.4
ENV STEAM_API_KEY D47241EEB96054372AD81BE592054810

ENV DB_PATH=/screeps/db.json ASSET_DIR=/screeps/assets \
        MODFILE=/screeps/mods.json GAME_PORT=21025 \
        GAME_HOST=0.0.0.0 CLI_PORT=21026 CLI_HOST=0.0.0.0 \
        STORAGE_PORT=21027 STORAGE_HOST=localhost \
        DRIVER_MODULE="@screeps/driver"


MAINTAINER Geoff Potter <geoffpot@gmail.com>
#guessin here
LABEL MAINTAINER="Geoff Potter <geoffpot@gmail.com>"


#add our files
ADD src/ /root/

#set entry
ENTRYPOINT [ "/root/docker-entry.sh" ]


VOLUME /server


# Use baseimage-docker's init system
#CMD ["/sbin/my_init"]

#expose game port
EXPOSE 21025 
#expose CLI port
EXPOSE 21026

# Fix a Debianism of the nobody's uid being 65534
RUN \
usermod -u 99 nobody && \
usermod -g 100 nobody && \
apt-get update && \
#add build tools
apt-get install -y build-essential tcl git && \
#install Node
curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
apt install -y nodejs && \
cd /server && \
npm install screeps && \
yes ${STEAM_API_KEY} | npx screeps init && \
#install standard mods
npm install screepsmod-mongo screepsmod-auth screepsmod-tickrate screepsmod-admin-utils screepsmod-features && \
npx screeps start