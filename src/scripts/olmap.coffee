# this spell needs to be incanted before openlayers loads, so we do it in inline js in the index.html
# proj4.defs 'EPSG:3067','+proj=utm +zone=35 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs'

EPSG = 'EPSG:3067'
projection = ol.proj.get EPSG
projection.setExtent [-548576.0, 6291456.0, 1548576.0, 8388608.0]
projectionExtent = projection.getExtent()
resolutions = [8192, 4096.0, 2048.0, 1024.0, 512.0, 256.0, 128.0, 64.0, 32.0, 16.0, 8.0, 4.0, 2.0, 1.0, 0.5, 0.25]
matrixIds = [0..15]

baseLayer = new ol.layer.Tile
    extent: projection.getExtent()
    source: new ol.source.XYZ
        format: 'image/png'
        projection: projection
        url:'http://geoserver.hel.fi/mapproxy/wmts/osm-sm/etrs_tm35fin/{z}/{x}/{y}.png'
        layer: 0
        tileGrid: new ol.tilegrid.WMTS
            origin: ol.extent.getTopLeft projection.getExtent()
            resolutions: resolutions
            matrixIds: matrixIds

heatmapLayer = new ol.layer.Image
    extent: projection.getExtent()
    source: new ol.source.ImageWMS
        url: 'http://geoserver.hel.fi/geoserver/popdensity/wms'
        params:
            STYLES: 'popdensity_asyht'
            # VERSION: '1.1.0'
            layers: 'popdensity:RTV201412'
            # srs: EPSG
            # srs: 'EPSG:3879' #openlayers seems to reproject this to the view projection so great!
        serverType: 'geoserver'


createMap = (element) ->
    map = new ol.Map
        target: element
        layers: [baseLayer, heatmapLayer]
        view: new ol.View
            projection: ol.proj.get 'EPSG:3067'
            resolutions: resolutions
            center: [385723, 6671672]
            zoom: 8
    map

exports.createMap = createMap