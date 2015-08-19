require('../lib/routes/route')(module) (router, route, {view: view}) ->
  route '/', view 'index',
    title: "Express"