sudo apt install git -y
virtualenv --python=python git01
cd git01/
source bin/activate
git clone git://github.com/django/django django-dev
pip install -e django-dev
django-admin --version


virtualenv --python=python django01
cd django01/
source bin/activate
pip install Django==2.0.5

django-admin startproject project01

cd project01/
tree
