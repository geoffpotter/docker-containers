FROM node:10.16.3-stretch
ENV SCREEPS_VERSION 4.0.4
WORKDIR /server
RUN yarn add screeps@"$SCREEPS_VERSION"

FROM node:10.16.3-stretch
VOLUME /server
WORKDIR /server
ENV DB_PATH=/server/db.json ASSET_DIR=/server/assets \
        MODFILE=/server/mods.json GAME_PORT=21025 \
        GAME_HOST=0.0.0.0 CLI_PORT=21026 CLI_HOST=0.0.0.0 \
        STORAGE_PORT=21027 STORAGE_HOST=localhost \
        DRIVER_MODULE="@screeps/driver" \
        API_KEY=keygoeshere
#WORKDIR /server
#RUN apk add --no-cache git
#COPY --from=0 /server /server

#add our files
COPY "screeps-run.sh" "/server/screeps-run.sh"
#RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/server/screeps-run.sh"]

RUN usermod -u 99 nobody && \
usermod -g 100 nobody