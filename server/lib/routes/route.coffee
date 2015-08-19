_ = require('underscore')

configureController = (routeModule, body) ->
  router = require('express').Router()
  body router, route(router), view
  routeModule.exports = router

route = (router) ->
  (name, body) ->
    router.get(name, body)

view = (name, data) ->
  (req, res, next) ->
    if data == undefined
      res.render name
    else if typeof data == 'function'
      res.render name, data(req, res)
    else if typeof data == 'object'
      res.render name, data
    else throw "The info given must be of type 'object' or 'function'"


module.exports = (routeModule) ->
  _.partial(configureController, routeModule)
