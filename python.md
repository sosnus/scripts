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