# REGISTRY
docker run -d   -p 5000:5000   --restart=always   --name registry   -v /data/dockervolumes/registry:/var/lib/registry   registry:2

# JENKINS
docker run -u 0 -d  -p 8080:8080 -p 50000:50000 --restart=always --name jenkins-server -v /data/dockerimages/jenkins:/var/jenkins_home jenkins/jenkins:lts

# MINIO


# MONGO
