# Snippets
pip or pip3?
```bash

pip --version




pip install --upgrade pip
pip list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1 | xargs -n1 pip install -U





```