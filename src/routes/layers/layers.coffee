exports.attachHandlers = (app) ->
    #GET
    app.get '/layers', printRequest

    #POST
    #nothing here

printRequest = (req, res) ->
    # # res.send 'Its layers'
    # console.log v for k,v of req.query when k == 'layers'
    # layerlist = (v for k,v of req.query when k == 'layers').split ','
    layers = v for k,v of req.query when k == 'layers'
    if layers && layers.length > 0
        res.render 'layerlist', { layers: layers.split ',' }
    else
        res.render 'layerlist', { layers: [] }
