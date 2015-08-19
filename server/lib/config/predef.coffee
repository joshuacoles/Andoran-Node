exports.err404 = (req, res, next) ->
  err = new Error 'Not Found'
  err.status = 404
  next err

exports.devErrHandler = (err, req, res, next) ->
  res.status err.status or 500
  res.render 'error',
    message: err.message
    error: err

exports.prodErrHandler = (err, req, res, next) ->
  res.status err.status or 500
  res.render 'error',
    message: err.message
    error: {}

errHandler = (errGetter) ->

