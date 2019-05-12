# use sudo time bash ./mycfg.sh

echo "#1 add local to PATH ##################################################################"
export PATH=$PATH:~/.local/bin

echo "#2 apt update ##################################################################"
sudo apt update -y

echo "#3 install screenfetch ##################################################################"
sudo apt install screenfetch -y

echo "#4 reinstall and update python3 and pip ##################################################################"
# sudo python3 -m pip uninstall pip
sudo apt install python3-pip --reinstall -y

echo "#5 install jupyter ##################################################################"
python3 -m pip install jupyter

echo "#6 install sl ##################################################################"
sudo apt-get install sl

echo "#1 show version: screenfetch ****************************************"
screenfetch
echo "#2 show version: pip3 ****************************************"
pip3 --version
echo "#3 show version: python3 ****************************************"
python3 -V
echo "#4 show version: jupyter core ****************************************"
jupyter --version
echo "#5 show version: jupyter notebook ****************************************"
jupyter-notebook --version

echo "#6 but trains are awesome @@@@@@@@@@@@@@@@@"
sl -e

echo "DONE!!! @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
#TODO: notebook themes, jupyter lab
