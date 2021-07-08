FROM node:10.16.3-stretch
#FROM ubuntu:16.04

ENV PLUGINS "screepsmod-auth screepsmod-admin-utils screepsmod-features screepsmod-mongo @screeps/simplebot screeps-bot-tooangel screeps-bot-overmind screeps-bot-kasamibot screeps-bot-hivemind"
ENV RUNNER_THREADS 10
ENV WORLD_THREADS 10
ENV STORAGE_DISABLED true

WORKDIR /server
ENV DB_PATH=/server/db.json ASSET_DIR=/server/assets \
        MODFILE=/server/mods.json GAME_PORT=21025 \
        GAME_HOST=0.0.0.0 CLI_PORT=21026 CLI_HOST=0.0.0.0 \
        STORAGE_PORT=21027 STORAGE_HOST=localhost \
        DRIVER_MODULE="@screeps/driver" \
        API_KEY=keygoeshere \
        MONGO_HOST=10.0.0.180 \
        REDIS_HOST=10.0.0.180


COPY ./src/ /server/

WORKDIR /server/

#RUN exec npm install screeps

EXPOSE 21025
RUN chmod +x screeps-run.sh

#ENTRYPOINT tail -f /server/screeps-run.sh
#ENTRYPOINT ls -l && pwd && /server/screeps-run.sh
#ENTRYPOINT ls -l && pwd && cat /server/screeps-run.sh
#ENTRYPOINT ls -l && pwd && cat /server/screeps-run.sh && sh /server/screeps-run.sh
ENTRYPOINT bash screeps-run.sh
#ENTRYPOINT bash screeps-run.sh && tail -f /server/screeps-run.sh
VOLUME /server/


RUN usermod -u 99 nobody && \
usermod -g 100 nobody
