# Python
![Python Release Cycle](https://www.mostlypython.com/content/images/2024/03/py_release_cycle_bordered.png)

# libs

pip3 install opencv-python

### Influxdb
```bash
pip3 install influxdb-client
```

``` python
import influxdb_client
from influxdb_client.client.write_api import SYNCHRONOUS


url = "http://localhost:8086"
token = "??"
org = "??"
bucket = "??"

client = influxdb_client.InfluxDBClient(
    url=url,
    token=token,
    org=org
)

# Write script
write_api = client.write_api(write_options=SYNCHRONOUS)

p = influxdb_client.Point("my_measurement").tag("location", "Prague").field("temperature", 25.3)
write_api.write(bucket=bucket, org=org, record=p)
```

### .ENV
``` bash
pip3 install python-dotenv
```

``` text
TOKEN=your_token_here
```


``` python
from dotenv import load_dotenv
import os

load_dotenv()

token = os.getenv("TOKEN")
print(token)
```



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
```