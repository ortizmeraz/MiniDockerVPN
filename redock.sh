#!/usr/bin/env bash

# stop & remove all containers
docker stop "$(docker ps -aq)"
docker rm   "$(docker ps -aq)"
sleep 5
sudo rm DockerConfs/gluetun/servers.json
# bring up your stacks
docker-compose -f docker/portainer-compose.yml up -d --remove-orphans
sleep 1
docker-compose -f docker/VPN_compose.yml      up -d --remove-orphans
sleep 5
docker-compose -f docker/Services-compose.yml up -d --remove-orphans
sleep 1
docker-compose -f docker/podgrab.yml up -d --remove-orphans
sleep 1
docker-compose -f docker/Syncthing.yml up -d --remove-orphans
sleep 1