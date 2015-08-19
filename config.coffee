express       = require('express'                       )
logger        = require('morgan'                        )

cookieParser  = require('cookie-parser'                 )
bodyParser    = require('body-parser'                   )
stylus        = require('stylus'                        )
autoprefixer  = require('autoprefixer-stylus'           )

app           = express(                                )

props         = require('./server/lib/config/properties')(__dirname) #NOTE: THIS NEEDS TO BE BEFORE ALL OTHER CUSTOM ONES!!!
route         = require('./server/lib/config/routes'    )(app)
predef        = require('./server/lib/config/predef'    )

debug         = require('debug'                         )('andor:server')
http          = require('http'                          )

app.set 'views'       , props.client.views
app.set 'view engine' , 'jade'

app.use logger 'dev'
app.use bodyParser.json()
app.use bodyParser.urlencoded {extended: false}
app.use cookieParser()

app.use stylus.middleware
  src: props.client.root
  compile: (str, path) ->
    stylus(str)
    .set('filename', path)
    .set('compress', true)
    .use(autoprefixer())

app.use express.static props.client.root

route '/'             , 'index'
route '/users'        , 'users'

app.use predef.err404

app.use predef.devErrHandler if app.get 'env' == 'development'
app.use predef.prodErrHandler

app.set 'port', predef.normalizePort process.env.PORT or '3000'

server = http.createServer app

server.listen app.get 'port'

server.on 'error'     , predef.serverOnError app
server.on 'listening' , predef.serverOnListening server, debug