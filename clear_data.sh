#!/bin/bash
mkdir -p /opt/cmdbuild/pgadmin-data
mkdir -p /opt/cmdbuild/grafana-data

docker rm $(docker ps -a -f status=exited -q)
docker rmi $(docker images -a -q)
docker volume prune

docker volume create --opt type=none --opt o=bind --opt device=/opt/cmdbuild/cmdbuild-db cmdbuild-db
docker volume create --opt type=none --opt o=bind --opt device=/opt/cmdbuild/cmdbuild-tomcat cmdbuild-tomcat
docker volume create --opt type=none --opt o=bind --opt device=/opt/cmdbuild/pgadmin-data pgadmin-data
docker volume create --opt type=none --opt o=bind --opt device=/opt/cmdbuild/grafana-data grafana-data