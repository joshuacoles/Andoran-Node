require('../lib/routes/route')(module) (router, route, {view: view, raw: raw}) ->
  route '/', raw 'respond with a resource'
