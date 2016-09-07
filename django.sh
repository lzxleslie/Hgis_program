#!/bin/sh
gnome-terminal -x bash -c "./django_address.sh"
uwsgi --http :8000  --chdir /home/whu/projects/osmdjango --module django_wsgi --master



