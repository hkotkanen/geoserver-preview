exports.attachHandlers = (app) ->

	#pass the app instance to all routes that need routing here.
    # (require './hello/hello').attachHandlers app
	(require './layers/layers').attachHandlers app