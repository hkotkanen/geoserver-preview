exports.attachHandlers = (app) ->
	#GET
	app.get '/hello', greetBack

	#POST
	#nothing here

greetBack = (req, res) ->
	res.send 'Hello to you back, good woman. asdfsfd'