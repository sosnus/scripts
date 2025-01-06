# Snippets
pip or pip3?
```bash

pip --version




pip install --upgrade pip
pip list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1 | xargs -n1 pip install -U





```
# Python misc version from deadsnake install
https://www.makeuseof.com/install-python-ubuntu/
```bash
sudo apt install software-properties-common
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt update
<!-- sudo apt install python3.3 -->
sudo apt install python3.8
<!-- sudo apt install python3.10 -->
```


sudo snap remove python38


find / -name 'python*' 2>/dev/null | grep python

curl -O https://bootstrap.pypa.io/get-pip.py
python3.8 get-pip.py



python3.8 -m pip install -r requirements.txt