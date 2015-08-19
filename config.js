// Generated by CoffeeScript 1.9.2
(function() {
  var app, autoprefixer, bodyParser, cookieParser, debug, express, http, logger, paths, predef, route, server, stylus;

  express = require('express');

  logger = require('morgan');

  cookieParser = require('cookie-parser');

  bodyParser = require('body-parser');

  stylus = require('stylus');

  autoprefixer = require('autoprefixer-stylus');

  app = express();

  paths = require('./server/lib/config/paths')(__dirname);

  route = require('./server/lib/config/routes')(app);

  predef = require('./server/lib/config/predef');

  debug = require('debug')('andor:server');

  http = require('http');

  app.set('views', paths.client.views);

  app.set('view engine', 'jade');

  app.use(logger('dev'));

  app.use(bodyParser.json());

  app.use(bodyParser.urlencoded({
    extended: false
  }));

  app.use(cookieParser());

  app.use(stylus.middleware({
    src: paths.client.root,
    compile: function(str, path) {
      return stylus(str).set('filename', path).set('compress', true).use(autoprefixer());
    }
  }));

  app.use(express["static"](paths.client.root));

  route('/', 'index');

  route('/users', 'users');

  app.use(predef.err404);

  if (app.get('env' === 'development')) {
    app.use(predef.devErrHandler);
  }

  app.use(predef.prodErrHandler);

  app.set('port', predef.normalizePort(process.env.PORT || '3000'));

  server = http.createServer(app);

  server.listen(app.get('port'));

  server.on('error', predef.serverOnError(app));

  server.on('listening', predef.serverOnListening(server, debug));

}).call(this);

//# sourceMappingURL=config.js.map
