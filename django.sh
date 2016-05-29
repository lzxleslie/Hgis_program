#!/bin/sh
echo "open Django server"
uwsgi --http :8000 --workers 4 --chdir /home/whu/projects/osmdjango --module django_wsgi

