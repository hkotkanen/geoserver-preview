express = require 'express'
routes = require './routes'
path = require 'path'

exports.createServer = ->
    app = express()
    app.set 'views', (path.join __dirname, './templates')
    app.set 'view engine', 'jade'
    app.use (express.static './dist')

    routes.attachHandlers(app)

    server = app.listen 3000