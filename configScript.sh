echo "#1 apt update ##################################################################"
sudo apt update

echo "#2 install screenfetch ##################################################################"
sudo apt install screenfetch

echo "#3 reinstall and update python3 and pip ##################################################################"
sudo python3 -m pip uninstall pip && sudo apt install python3-pip --reinstall

echo "#4 install jupyter ##################################################################"
sudo apt install jupyter-core

echo "#1 show version: screenfetch ******************************************************************"
screenfetch
echo "#2 show version: pip3 ******************************************************************"
pip3 --version
echo "#3 show version: python3 ******************************************************************"
python3 -V
echo "#4 show version: jupyter ******************************************************************"
jupyter --version
