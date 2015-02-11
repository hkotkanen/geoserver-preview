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
    res.render 'layerlist', { layers: layers.split ',' }