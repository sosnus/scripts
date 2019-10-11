echo "GRAFANA INSTALL"

apt-get install -y software-properties-common

sudo add-apt-repository "deb https://packages.grafana.com/oss/deb stable main"

sudo apt-get update
sudo apt-get install grafana

#maybe below
# sudo apt-get install -y apt-transport-https

#to start
sudo service grafana-server start
sudo update-rc.d grafana-server defaults

# goto ROOT ADD MONGO PLUGIN

# about plugins https://grafana.com/docs/plugins/installation/
# plugin source https://github.com/JamesOsgood/mongodb-grafana
# sudo su
# cd /var/lib/grafana/plugins/
# git clone https://github.com/JamesOsgood/mongodb-grafana.git
# grafana-cli plugins update-all
# service grafana-server restart
