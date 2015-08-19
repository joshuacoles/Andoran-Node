exports.err404 = (req, res, next) ->
  err = new Error 'Not Found'
  err.status = 404
  next err

exports.errHandler = (errGetter) ->
  (err, req, res, next) ->
    res.status = err.status or 500
    res.render 'error',
      message: err.message
      error: errGetter(err)

exports.devErrHandler = exports.errHandler (_) -> _
exports.prodErrHandler = exports.errHandler (_) -> {}

exports.normalizePort = (val) ->
  port = parseInt val, 10

  return val if isNaN port
  return port if port >= 0
  return false

exports.serverOnError = (app) ->
  (error) ->
    throw error if error.syscall != 'listen'

    bind = (if typeof app.get 'port' == 'string' then 'Pipe ' else 'Port ') + port
    switch error.code
      when 'EACCES'
        exit "#{bind} requires elevated privileges"
      when 'EADDRINUSE'
        exit "#{bind} is already in use"
      else throw error

exports.serverOnListening = (server, debug) ->
  ->
    addr = server.address()
    bind =
      if typeof server.address() == 'string' then 'pipe ' + addr else 'port ' + server.address().port
    debug("Listening  on #{bind}")

exit = (msg) ->
  console.error msg
  process.exit 1
