express       = require('express'                       )
logger        = require('morgan'                        )

cookieParser  = require('cookie-parser'                 )
bodyParser    = require('body-parser'                   )
stylus        = require('stylus'                        )

app           = express(                                )

route         = require('./server/lib/config/routes'    )(app)
props         = require('./server/lib/config/properties')(__dirname)
predef         = require('./server/lib/config/predef'   )

app.set 'views'       , props.client.views
app.set 'view engine' , 'jade'

app.use logger 'dev'
app.use bodyParser.json()
app.use bodyParser.urlencoded {extended: false}
app.use cookieParser()
app.use stylus.middleware props.client.root
app.use express.static props

route '/'             , 'index'
route '/users'        , 'users'

app.use predef.err404

app.use predef.devErrHandler if app.get 'env' == 'development'
app.use predef.prodErrHandler

module.exports = app