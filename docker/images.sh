# REGISTRY
docker run -d   -p 5000:5000   --restart=always   --name registry   -v /data/dockervolumes/registry:/var/lib/registry   registry:2

# JENKINS
docker run -u 0 -d  -p 8080:8080 -p 50000:50000 --restart=always --name jenkins-server -v /data/dockerimages/jenkins:/var/jenkins_home jenkins/jenkins:lts

# MINIO


# MONGO

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



