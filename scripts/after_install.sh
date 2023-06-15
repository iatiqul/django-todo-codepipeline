#!/usr/bin/env bash

# kill any servers that may be running in the background 
sudo pkill -f runserver

# kill frontend servers if you are deploying any frontend
# sudo pkill -f tailwind
# sudo pkill -f node

cd /home/ubuntu/django-todo-codepipeline/

# activate virtual environment
python3 -m venv .venv
source .venv/bin/activate

install requirements.txt
pip install -r /home/ubuntu/django-todo-codepipeline/requirements.txt
python3 manage.py collectstatic --noinput
python3 manage.py makemigrations
python3 manage.py migrate
uwsgi --ini mysite.uwsgi.ini

# run server
screen -d -m python3 manage.py runserver 0:8000
