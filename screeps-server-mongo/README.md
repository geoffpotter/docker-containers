docker build -t redijedi/screeps-mongo .
docker rm screeps && docker run -d --name screeps -p 27025:27025 redijedi/screeps-mongo -v /e/code/test-server/:/server/
docker rm screeps


docker build -t redijedi/screeps-mongo . && docker rm screeps && docker run -d --name screeps -p 21025:21025 -e API_KEY=D47241EEB96054372AD81BE592054810 redijedi/screeps-mongo -v /e/code/test-server/:/server/