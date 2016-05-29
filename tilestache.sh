#!/bin/sh
echo "open TileStache Server"
uwsgi --http :8888 --workers 4 --eval 'import TileStache; application = TileStache.WSGITileServer("/home/whu/src/TileStache/tilestache.cfg")'

