### Port <host>:<container>
#  --restart=always
### LAZYDOCKER INSTALL script ###
curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash

# GET DATETIME (for example for tags):
MYVAR=$(date +%y-%m-%d--%H-%M-%S)
echo $MYVAR


# DOCKER!
docker pull docker
docker run -it --name container-docker docker sh  
docker attach docker-container
docker exec -it jenkins-container /bin/bash
docker start jenkins-container


# ZEROTIER
# more https://hub.docker.com/r/zerotier/zerotier
docker run --name zerotier-container --rm --cap-add NET_ADMIN --device /dev/net/tun zerotier/zerotier:latest abcdefdeadbeef00
docker exec -it zerotier-container /bin/bash

# FILEBROWSER
docker run -v /root/workspace/jenkins-workspace:/srv -d --name filebrowser-container --restart=always -p 8082:80 filebrowser/filebrowser

# TELEGRAF
# docker run --it --name telegraf-container sh telegraf:alpine
# docker run --name telegraf-container telegraf:alpine

# JAVA SPRING build and run
docker build -t iap-back .
docker run --name  container-iap-back -p 8081:80 -d iap-back
docker logs -f container-iap-back

# NGINX
docker run --name nginx-container -d -p 80:80 nginx

# RUNDECK
sudo docker run --name some-rundeck -p 4440:4440 -v data:/home/rundeck/server/data rundeck/rundeck:4.13.0

# NODE-RED
docker run -it -d -p 1880:1880 --restart unless-stopped -v node_red_data:/data --name nodered-container nodered/node-red

# REGISTRY
docker run -d -p 5000:5000 --restart=always --name registry -v /data/dockervolumes/registry:/var/lib/registry   registry:2

# JENKINS
docker run -u 0 -d  -p 8080:8080 -p 50000:50000 --restart=always --name jenkins-container -v /data/dockerimages/jenkins:/var/jenkins_home jenkins/jenkins:lts

# INFLUXDB
docker run -d -p 8086:8086 --restart=always --name=container-influxdb -v influxdb:/var/lib/influxdb influxdb:1.7

# GRAFANA
docker run -d --name=grafana -p 40156:3000 --name grafana-container -d grafana/grafana:8.5.26

# OPENCV (run interactive)
docker run -it -v /Users/stanislawpulawski/data/dockervolumes/opencv:/data/workspace jjanzic/docker-python3-opencv bash  

docker run -d --name=grafana -p 40017 --name grafana-container -d grafana/grafana-oss:10.0.12

# Tago Core TCORE
docker run -p 8888:8888 -p 8999:8999 tagoio/tagocore
docker run -p 40083:8888 -p 40084:8999 --name tcore-container -d tagoio/tagocore:0.7-alpine

# MINIO
docker run -d -p 9000:9000 -p 9001:9001 --restart=always --name minio-storage \
  -e "MINIO_ROOT_USER=miniouseradmin" \
  -e "MINIO_ROOT_PASSWORD=wJalrXUtnFEMK7MDEPxRfiCYEXAMPLEKEY" \
  -v /root/miniodata:/data/minio \
  minio/minio server /data/minio  --console-address ":9001"

 ## deprecated minio 
docker run -d -p 9000:9000 --restart=always --name minio-storage \
  -e "MINIO_ACCESS_KEY=miniouseradmin" \
  -e "MINIO_SECRET_KEY=wJalrXUtnFEMK7MDEPxRfiCYEXAMPLEKEY" \
  -v /home/zombie/data/minio:/data/minio \
  minio/minio server /data/minio

# MYSQL
docker run --name  container-mysql -p 3306:3306 --restart=always -e MYSQL_ROOT_PASSWORD=SECRET -d mysql:8.0

-- docker run --name  container-mysql -p 3306:3306 --restart=always -e MYSQL_ROOT_PASSWORD=SECRET -d mysql:5.7

docker run --name  some-mysql -p 3306:3306 -e MYSQL_ROOT_PASSWORD=my-secret-pw -d mysql

docker run --name  container-mysql -p 2001:3306 --restart=always -e MYSQL_ROOT_PASSWORD=my-secret-pw -d mysql

# MONGO
docker run -d -p 27017:27017  --restart=always --name mongo-container \
    -e MONGO_INITDB_ROOT_USERNAME=mongoadmin \
    -e MONGO_INITDB_ROOT_PASSWORD=secret \
    mongo:4.4.5-bionic

#MOSQUITTO
docker run -d -p 1883:1883 -p 1885:1885 -p 9001:9001  -v /data/dockervolumes/mosquitto/:/mosquitto/ --restart=always --name=mqtt-server-container eclipse-mosquitto
#docker run -d -p 1883:1883 -p 1885:1885 -p 9001:9001  -v mosquitto.conf:/data/dockervolumes/mosquitto/config/mosquitto.conf --restart=always --name=mqtt-server-container eclipse-mosquitto
# old broker, without local blockade: <host:kontener>
sudo docker run -d -p 1883:1883 --restart=always --name=mqtt-server-container eclipse-mosquitto:1.6


#ZABBIX CLIENT
sudo docker run -d --name zabbix-name --network=host --restart unless-stopped -e ZBX_HOST="192.168.2.45" -e ZBX_SERVER_HOST="192.168.2.45" -d zabbix/zabbix-agent:alpine-5.0.0

# ROS
docker run -d -it -v /data/dockervolumes/ros/:/data --restart=always --name ros-test ros

docker run -d -it -v /data/dockervolumes/ros/:/data --restart=always --name ros-test-xenial ros:kinetic-ros-xenial
# xenial 16 with ros1

docker exec -it ros-test bash

# JUPYTER LAB (macos)
docker run -d -p 10000:8888 -e JUPYTER_ENABLE_LAB=yes -e GRANT_SUDO=yes --user root -v /Users/stanislawpulawski/data/dockervolumes/jupyter:/home/jovyan/work --name jupyter-lab jupyter/datascience-notebook:latest start-notebook.sh --NotebookApp.token=''
# https://hub.docker.com/r/jupyter/datascience-notebook
# how to add JS: https://github.com/n-riesco/ijavascript?tab=readme-ov-file#ubuntu

 MyToken='MyTokenHere'
# better path
docker run -d -p 10000:8888 -e JUPYTER_ENABLE_LAB=yes -e GRANT_SUDO=yes --user root -v /root/storage/jupyterfiles:/home/jovyan/work --restart=always --name jupyter-lab jupyter/datascience-notebook:latest start-notebook.sh --NotebookApp.token=$MyToken

# Jupyter lab skaner
MyToken='MyTokenHere'
MyAddr='/data/dockervolumes/jupyter/merkury'
sudo docker run -d -p 10000:8888 -e JUPYTER_ENABLE_LAB=yes -e GRANT_SUDO=yes --user root -v /data/dockervolumes/jupyter/merkury:/home/jovyan/work --restart=always --name jupyter-lab jupyter/datascience-notebook:latest start-notebook.sh --NotebookApp.token=$MyToken

# JUPYTER HUB
sudo docker run -d -p 1003:8000 --restart=always --name jupyterhub jupyterhub/jupyterhub jupyterhub
# more: https://jupyterhub.readthedocs.io/en/stable/tutorial/quickstart-docker.html#run-the-docker-image

# new image source: https://quay.io/repository/jupyter/datascience-notebook
docker pull quay.io/jupyter/datascience-notebook
docker run -d -p 10000:8888 -e JUPYTER_ENABLE_LAB=yes -e GRANT_SUDO=yes --user root -v /root/storage/jupyterfiles:/home/jovyan/work --restart unless-stopped --name jupyter-lab quay.io/jupyter/datascience-notebook:latest start-notebook.sh --NotebookApp.token=$MyToken


# SKANER ROS
docker build -t skaner/kineticmqtt:latest .
docker run -p 1887:8080 -d -it -v /data/dockervolumes/ros/:/data --restart=always --name skaner-kinetic-mqtt skaner/kineticmqtt:latest
docker run -p 1887:8080 -d -it -v /Users/stapul/data/dockervolumes/ros/:/data --restart=always --name skaner-kinetic-mqtt skaner/kineticmqtt:latest
docker exec -it skaner-kinetic-mqtt /ros_entrypoint.sh bash
