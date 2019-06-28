echo("INSTALL JAVA")
# echo("command source: https://www.digitalocean.com/community/tutorials/how-to-install-java-with-apt-get-on-ubuntu-16-04 ")

sudo apt-get update

# sudo apt-get install default-jre

sudo apt-get install default-jdk

echo $JAVA_HOME

java --version
