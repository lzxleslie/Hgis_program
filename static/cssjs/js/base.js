var map;
var baseLayer;
function init(){
	map = new ol.Map({
		target: 'map',
		// layers: [
		// 	new ol.layer.Tile({
		// 		source: new ol.source.XYZ({
		// 			url: 'http://localhost:8888/dark1/{z}/{x}/{y}.png'
		// 		})
		// 	})
		// ],
		view: new ol.View({
			center: ol.proj.transform([104.40,31.13], 'EPSG:4326', 'EPSG:3857'),
			zoom: 8
		}),
		controls: ol.control.defaults({
			attributionOption: {
				collapsible: false
			}
		})
	});

	baseLayer = new ol.layer.Tile({
		source: new ol.source.XYZ({
			url: "http://localhost:8888/light/{z}/{x}/{y}.png"
		})
	});

	map.addLayer(baseLayer);
}
