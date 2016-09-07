import mapnik
m = mapnik.Map(2560,2560)
mapnik.load_map(m, "whu.xml")
m.zoom_all()
mapnik.render_to_file(m, "the_image.png")
