import TileStache
import ModestMaps
import json
import os
from tempfile import mkstemp
import shapely.wkb
def getTile(layer,extension,x,y,z,cfg):
    contenttype, content = TileStache.getTile(cfg.layers[layer], ModestMaps.Core.Coordinate(int(x), int(y), int(z)),extension,ignore_cached=True)
    return content
