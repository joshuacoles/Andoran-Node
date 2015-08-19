exports.err404 = (req, res, next) ->
  err = new Error 'Not Found'
  err.status = 404
  next err

exports.devErrHandler = errHandler (_) -> _
exports.prodErrHandler = errHandler (_) -> {}

errHandler = (errGetter) ->
  (err, req, res, next) ->
    res.status = err.status or 500
    res.render 'error',
      message: err.message
      error: errGetter(err)
