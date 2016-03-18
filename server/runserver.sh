#!/bin/bash

cd /var/app
export PYTHONPATH=/var/app;$PYTHONPATH

python manage.py migrate --noinput
python manage.py init_basic_data
#python manage.py runserver 0.0.0.0:8080

#/usr/local/bin/gunicorn config.wsgi:application -w 2 -b :8000
/usr/local/bin/gunicorn --log-level info --log-file=- --workers 4 --name ampervue_gunicorn -b 0.0.0.0:8000 --reload config.wsgi:application