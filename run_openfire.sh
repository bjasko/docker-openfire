#!/bin/sh

PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

VOLUME_BASE=/data/openfire
S_HOST=openfire
S_DEV=wlan0
S_DOMAIN=bring.out.ba
S_HOST_IP=192.168.46.22
S_DNS_HOST_IP=192.168.46.254


sudo ip addr show | grep $S_HOST_IP || 
sudo ip addr add $S_HOST_IP/24 dev $S_DEV

docker rm -f $S_HOST.$S_DOMAIN

     
docker run -d \
     -v $VOLUME_BASE/$S_HOST.$S_DOMAIN:/var/lib/openfire \
     -v /tmp/syslogdev/log:/dev/log \
     -p $S_HOST_IP:9091:9091  \
     -p $S_HOST_IP:9090:9090  \
     -p $S_HOST_IP:5222:5222  \
     --name $S_HOST.$S_DOMAIN \
     --hostname $S_HOST.$S_DOMAIN  \
     --dns $S_DNS_HOST_IP \
     openfire


