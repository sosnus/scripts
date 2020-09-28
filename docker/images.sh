docker run -d   -p 5000:5000   --restart=always   --name registry   -v /data/dockervolumes/registry:/var/lib/registry   registry:2

