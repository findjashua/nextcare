
###
Module dependencies.
###
express = require('express')
routes = require('./routes')
user = require('./routes/user')
http = require('http')
path = require('path')
app = express()

# all environments
app.set 'port', process.env.PORT or 3000
app.set 'views', __dirname + '/views'
app.set 'view engine', 'jade'
app.use express.favicon()
app.use express.logger('dev')
app.use express.bodyParser()
app.use express.methodOverride()
app.use app.router
app.use express.static(path.join(__dirname, 'public'))

# development only
app.use express.errorHandler()  if 'development' is app.get('env')
app.get '/', (req, res)->
	res.send 'server running'

pill = require './models/pill'
app.get '/pills', pill.list
app.get '/pills/productCode/:productCode', pill.findByProductCode
app.get '/pills/name/:name', pill.findByName
app.post '/pills', pill.create

conf = require './models/conf'
app.post '/invite', conf.invite

goodrx = require './external/goodrx'
app.get '/pillPrices/:name', goodrx.getPrices

ticket = require './models/ticket'
#app.post '/ticket/:type', ticket.create

http.createServer(app).listen app.get('port'), ->
  console.log 'Express server listening on port ' + app.get('port')

