path = require 'path'
props = require './properties'

route = (routePath) -> path.join props.server.routes, routePath

module.exports = (app) -> (
  (args...) ->
    switch args.length
      when 1 then require(route(args[0]))
      when 2 then app.use(args[0], require route(args[1]))
      else throw "Wrong number of args, either (path) to get the route object or (baseURL, path) to assign it."
)
