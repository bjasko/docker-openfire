# docker-openfire 


## build

     docker build -t openfire .

## run

     ./run_openfire.sh

## init setup

http://$S_HOST_IP:9090


## update openfire servera 

1. docker stop CTID
2. napravimo backup VOLUME_BASE 
3. setujemo željenu verziju,  OPENFIRE_VERSION=3.10.2 
4. docker build -t openfire . 
5.  ./run_openfire.sh

