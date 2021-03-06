# JAVA SPRING build and run
docker build -t iap-back .
docker run --name  container-iap-back -p 8081:80 -d iap-back
docker logs -f container-iap-back


# REGISTRY
docker run -d   -p 5000:5000   --restart=always   --name registry   -v /data/dockervolumes/registry:/var/lib/registry   registry:2

# JENKINS
docker run -u 0 -d  -p 8080:8080 -p 50000:50000 --restart=always --name jenkins-server -v /data/dockerimages/jenkins:/var/jenkins_home jenkins/jenkins:lts

# OPENCV (run interactive)
docker run -it -v /Users/stanislawpulawski/data/dockervolumes/opencv:/data/workspace jjanzic/docker-python3-opencv bash  

# MINIO
docker run -d -p 9000:9000 --restart=always --name minio-storage \
  -e "MINIO_ACCESS_KEY=miniouseradmin" \
  -e "MINIO_SECRET_KEY=wJalrXUtnFEMK7MDEPxRfiCYEXAMPLEKEY" \
  -v /home/zombie/data/minio:/data/minio \
  minio/minio server /data/minio

# MYSQL
docker run --name  some-mysql -p 3306:3306 -e MYSQL_ROOT_PASSWORD=my-secret-pw -d mysql

# MONGO
docker run -d -p 27017:27017  --restart=always --name mongo-container \
    -e MONGO_INITDB_ROOT_USERNAME=mongoadmin \
    -e MONGO_INITDB_ROOT_PASSWORD=secret \
    mongo:4.4.5-bionic

#MOSQUITTO
docker run -d -p 1883:1883 -p 1885:1885 -p 9001:9001  -v /data/dockervolumes/mosquitto/:/mosquitto/ --restart=always --name=mqtt-server-container eclipse-mosquitto
#docker run -d -p 1883:1883 -p 1885:1885 -p 9001:9001  -v mosquitto.conf:/data/dockervolumes/mosquitto/config/mosquitto.conf --restart=always --name=mqtt-server-container eclipse-mosquitto

#ZABBIX CLIENT
sudo docker run --name zabbix-name --network=host --restart unless-stopped -e ZBX_HOST="192.168.2.45" -e ZBX_SERVER_HOST="192.168.2.45" -d zabbix/zabbix-agent:alpine-5.0.0

# ROS
docker run -d -it -v /data/dockervolumes/ros/:/data --restart=always --name ros-test ros

docker run -d -it -v /data/dockervolumes/ros/:/data --restart=always --name ros-test-xenial ros:kinetic-ros-xenial
# xenial 16 with ros1

docker exec -it ros-test bash

# JUPYTER LAB
docker run -p 10000:8888 -e JUPYTER_ENABLE_LAB=yes -e GRANT_SUDO=yes --user root -v /Users/stanislawpulawski/data/dockervolumes/jupyter:/home/jovyan/work --name jupyter-lab jupyter/datascience-notebook:latest start-notebook.sh --NotebookApp.token=''

# Jupyter lab skaner
MyToken='MyTokenHere'
MyAddr='/data/dockervolumes/jupyter/merkury'
sudo docker run -d -p 10000:8888 -e JUPYTER_ENABLE_LAB=yes -e GRANT_SUDO=yes --user root -v /data/dockervolumes/jupyter/merkury:/home/jovyan/work --restart=always --name jupyter-lab jupyter/datascience-notebook:latest start-notebook.sh --NotebookApp.token=$MyToken

# SKANER ROS
docker build -t skaner/kineticmqtt:latest .
docker run -p 1887:8080 -d -it -v /data/dockervolumes/ros/:/data --restart=always --name skaner-kinetic-mqtt skaner/kineticmqtt:latest
docker run -p 1887:8080 -d -it -v /Users/stapul/data/dockervolumes/ros/:/data --restart=always --name skaner-kinetic-mqtt skaner/kineticmqtt:latest
docker exec -it skaner-kinetic-mqtt /ros_entrypoint.sh bash
