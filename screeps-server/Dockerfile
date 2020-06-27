# set base os
FROM phusion/baseimage:0.9.16

MAINTAINER Geoff Potter <geoffpot@gmail.com>
#guessin here
LABEL MAINTAINER="Geoff Potter <geoffpot@gmail.com>"


#add our files
ADD src/ /root/

#set entry
ENTRYPOINT [ "/root/docker-entry.sh" ]


VOLUME /config /server


# Use baseimage-docker's init system
#CMD ["/sbin/my_init"]

#expose game port
EXPOSE 21025 
#expose CLI port
EXPOSE 21026

# Fix a Debianism of the nobody's uid being 65534
RUN usermod -u 99 nobody && \
usermod -g 100 nobody && \
#add build tools
apt install -y build-essential tcl git && \
#install Node
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash - && \
sudo apt install -y nodejs && \
#install standard mods
npm install screepsmod-mongo screepsmod-auth screepsmod-tickrate screepsmod-admin-utils screepsmod-features