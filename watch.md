# Watch
run script in loop with interval
```
watch -n 600 <command> <flags>
```
## Alternative
(The best way is do this using tmux)
```bash
#!/bin/bash

while true; do
    node app.js
done
```



Bash alternative
while true; do ./my_script.sh; sleep 60; don
