# cmdbuild_dev

###Remove images, containers, volumes
```
docker rm $(docker ps -a -f status=exited -q)
docker rmi $(docker images -a -q)
docker volume prune
```
Remove images, containers, volumes 
```bash
docker volume rm cmdbuild-db
docker volume rm cmdbuild-tomcat

rm -rf /opt/cmdbuild/

mkdir -p /opt/cmdbuild/cmdbuild-db
mkdir -p /opt/cmdbuild/cmdbuild-tomcat

docker volume rm cmdbuild-db
docker volume rm cmdbuild-tomcat
```
### Create volume
```bash
docker volume create --opt type=none --opt o=bind --opt device=/opt/cmdbuild/cmdbuild-db cmdbuild-db
docker volume create --opt type=none --opt o=bind --opt device=/opt/cmdbuild/cmdbuild-tomcat cmdbuild-tomcat
```

### Deploy by docker run
**CMDbuild with demo database**  
```bash
docker run --name cmdbuild_db -p 5432:5432 -d olehkondratov/cmdbuild:db-12
docker run --name cmdbuild_app --link cmdbuild_db  -p 8090:8080 -d itmicus/cmdbuild:app-3.3
```

**CMDbuild Ready2use 2.0**  
```bash  
docker run --name cmdbuild_db -p 5432:5432 -d itmicus/cmdbuild:db-12
docker run --name cmdbuild_app --restart unless-stopped -e CMDBUILD_DUMP="ready2use_demo.dump.xz" --link cmdbuild_db  -p 8090:8080 -d  olehkondratov/ready2use-2.3-3.4.1:latest
```  

#### CMDBUILD_DUMP values
* demo.dump.xz
* empty.dump.xz
