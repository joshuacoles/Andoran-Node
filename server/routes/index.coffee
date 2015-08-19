require('../lib/routes/route')(module) (router, route, view) ->

  route '/', view 'index',
    title: "Express"